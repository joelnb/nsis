#include <windows.h>
#include "fileform.h"
#include "util.h"
#include "state.h"
#include "resource.h"
#include "lang.h"

#ifdef NSIS_CONFIG_COMPRESSION_SUPPORT
#ifdef NSIS_COMPRESS_USE_ZLIB
#include "../zlib/zlib.h"
#endif

#ifdef NSIS_COMPRESS_USE_BZIP2
#include "../bzip2/bzlib.h"

#define z_stream DState
#define inflateInit(x) BZ2_bzDecompressInit(x)
#define inflateReset(x) BZ2_bzDecompressInit(x)

#define inflate(x) BZ2_bzDecompress(x)
#define Z_OK BZ_OK
#define Z_STREAM_END BZ_STREAM_END
#endif//NSIS_COMPRESS_USE_BZIP2

#endif

#include "ui.h"

char *g_db_strtab;

static int g_db_offset;
HANDLE g_db_hFile;

#if defined(NSIS_CONFIG_COMPRESSION_SUPPORT) && defined(NSIS_COMPRESS_WHOLE)
HANDLE dbd_hFile=INVALID_HANDLE_VALUE;
static int dbd_size, dbd_pos, dbd_srcpos, dbd_fulllen;
#endif//NSIS_COMPRESS_WHOLE

static int m_length;
static int m_pos;

#ifdef NSIS_CONFIG_VISIBLE_SUPPORT
#if defined(NSIS_CONFIG_CRC_SUPPORT) || defined(NSIS_COMPRESS_WHOLE)
BOOL CALLBACK verProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
  static char *msg;
  if (uMsg == WM_INITDIALOG)
  {
    SetTimer(hwndDlg,1,250,NULL);
    msg = (char*)lParam;
    uMsg = WM_TIMER;
  }
  if (uMsg == WM_TIMER)
  {
    static char bt[64];
    wsprintf(bt,msg,MulDiv(m_pos,100,m_length));

    my_SetWindowText(hwndDlg,bt);
    my_SetDialogItemText(hwndDlg,IDC_STR,bt);
  }
  return 0;
}
#endif//NSIS_CONFIG_CRC_SUPPORT || NSIS_COMPRESS_WHOLE
#endif//NSIS_CONFIG_VISIBLE_SUPPORT

int inst_flags;

#ifdef NSIS_CONFIG_COMPRESSION_SUPPORT
static z_stream g_inflate_stream;
#endif

extern unsigned long NSISCALL CRC32(unsigned long crc, const unsigned char *buf, unsigned int len);

const char * NSISCALL loadHeaders(int cl_flags)
{
#ifdef NSIS_CONFIG_CRC_SUPPORT
#ifdef NSIS_CONFIG_VISIBLE_SUPPORT
  HWND hwnd = 0;
  unsigned int verify_time = GetTickCount() + 1000;
#endif
  int crc = 0;
  int do_crc = 0;
#endif//NSIS_CONFIG_CRC_SUPPORT
  int left;

  void *data;
  firstheader h;

  GetModuleFileName(g_hInstance, state_exe_directory, NSIS_MAX_STRLEN);

  g_db_hFile = myOpenFile(state_exe_directory, GENERIC_READ, OPEN_EXISTING);
  if (g_db_hFile == INVALID_HANDLE_VALUE)
  {
    return _LANG_CANTOPENSELF;
  }

  // make state_exe_directory point to dir, not full exe.

  trimslashtoend(state_exe_directory);

  left = m_length = GetFileSize(g_db_hFile,NULL);
  while (left > 0)
  {
    static char temp[512];
    DWORD l = left;
    l = min(l, 512);
    if (!ReadSelfFile(temp, l))
    {
#if defined(NSIS_CONFIG_CRC_SUPPORT) && defined(NSIS_CONFIG_VISIBLE_SUPPORT)
      if (hwnd) DestroyWindow(hwnd);
#endif//NSIS_CONFIG_CRC_SUPPORT
      return _LANG_INVALIDCRC;
    }

    if (!g_filehdrsize)
    {
      mini_memcpy(&h, temp, sizeof(firstheader));
      if (
           (h.flags & (~FH_FLAGS_MASK)) == 0 &&
           h.siginfo == FH_SIG &&
           h.nsinst[2] == FH_INT3 &&
           h.nsinst[1] == FH_INT2 &&
           h.nsinst[0] == FH_INT1
         )
      {
        if (h.length_of_all_following_data > left)
          return _LANG_INVALIDCRC;

        g_filehdrsize = m_pos;

#if defined(NSIS_CONFIG_SILENT_SUPPORT) && defined(NSIS_CONFIG_VISIBLE_SUPPORT)
        cl_flags |= h.flags & FH_FLAGS_SILENT;
#endif//NSIS_CONFIG_SILENT_SUPPORT && NSIS_CONFIG_VISIBLE_SUPPORT

#ifdef NSIS_CONFIG_CRC_SUPPORT
        if ((h.flags & FH_FLAGS_FORCE_CRC) == 0)
        {
          if ((cl_flags & FH_FLAGS_NO_CRC) | (h.flags & FH_FLAGS_NO_CRC))
            break;
        }

        do_crc++;

#ifndef NSIS_CONFIG_CRC_ANAL
        left = h.length_of_all_following_data - 4;
        // end crc checking at crc :) this means you can tack shit on the end and it'll still work.
#else //!NSIS_CONFIG_CRC_ANAL
        left -= 4;
#endif//NSIS_CONFIG_CRC_ANAL
        // this is in case the end part is < 512 bytes.
        if (l > (DWORD)left) l=(DWORD)left;

#else//!NSIS_CONFIG_CRC_SUPPORT
        // no crc support, no need to keep on reading
        break;
#endif//!NSIS_CONFIG_CRC_SUPPORT
      }
    }
#ifdef NSIS_CONFIG_CRC_SUPPORT

#ifdef NSIS_CONFIG_VISIBLE_SUPPORT

#ifdef NSIS_CONFIG_SILENT_SUPPORT
    else if (cl_flags & FH_FLAGS_SILENT == 0)
#endif//NSIS_CONFIG_SILENT_SUPPORT
    {
      if (hwnd)
      {
        MSG msg;
        while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) DispatchMessage(&msg);
      }
      else if (GetTickCount() > verify_time)
        hwnd = CreateDialogParam(
          g_hInstance,
          MAKEINTRESOURCE(IDD_VERIFY),
          0,
          verProc,
          (LPARAM)_LANG_VERIFYINGINST
        );
    }
#endif//NSIS_CONFIG_VISIBLE_SUPPORT

#ifndef NSIS_CONFIG_CRC_ANAL
    if (left < m_length)
#endif//NSIS_CONFIG_CRC_ANAL
      crc = CRC32(crc, temp, l);

#endif//NSIS_CONFIG_CRC_SUPPORT
    m_pos += l;
    left -= l;
  }
#ifdef NSIS_CONFIG_VISIBLE_SUPPORT
#ifdef NSIS_CONFIG_CRC_SUPPORT
  if (hwnd) DestroyWindow(hwnd);
#endif//NSIS_CONFIG_CRC_SUPPORT
#endif//NSIS_CONFIG_VISIBLE_SUPPORT
  if (!g_filehdrsize) return _LANG_INVALIDCRC;

#ifdef NSIS_CONFIG_CRC_SUPPORT
  if (do_crc)
  {
    int fcrc;
    if (!ReadSelfFile(&fcrc, sizeof(int)) || crc != fcrc)
      return _LANG_INVALIDCRC;
  }
#endif//NSIS_CONFIG_CRC_SUPPORT

  data = (void *)my_GlobalAlloc(h.length_of_header);

#if defined(NSIS_CONFIG_COMPRESSION_SUPPORT) && defined(NSIS_COMPRESS_WHOLE)
  inflateReset(&g_inflate_stream);

  {
    char fno[MAX_PATH];
    my_GetTempFileName(fno, state_temp_dir);
    dbd_hFile=CreateFile(fno,GENERIC_WRITE|GENERIC_READ,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_TEMPORARY|FILE_FLAG_DELETE_ON_CLOSE,NULL);
    if (dbd_hFile == INVALID_HANDLE_VALUE)
      return _LANG_ERRORWRITINGTEMP;
  }
  dbd_srcpos = SetSelfFilePointer(g_filehdrsize + sizeof(firstheader), FILE_BEGIN);
  dbd_fulllen = dbd_srcpos - sizeof(h) + h.length_of_all_following_data - ((cl_flags & FH_FLAGS_NO_CRC) ? 0 : sizeof(int));
#else
  SetSelfFilePointer(g_filehdrsize + sizeof(firstheader), FILE_BEGIN);
#endif

  if ((crc = GetCompressedDataFromDataBlockToMemory(-1, data, h.length_of_header)) != h.length_of_header)
  {
    GlobalFree((HGLOBAL)data);
    return _LANG_INVALIDCRC;
  }

#if !defined(NSIS_COMPRESS_WHOLE) || !defined(NSIS_CONFIG_COMPRESSION_SUPPORT)
  g_db_offset = SetSelfFilePointer(0,FILE_CURRENT);
#else
  g_db_offset = dbd_pos;
#endif

  g_inst_combinedheader = data;

  inst_flags = g_inst_cmnheader->flags;
#ifdef NSIS_CONFIG_SILENT_SUPPORT
  if (cl_flags & FH_FLAGS_SILENT) inst_flags |= CH_FLAGS_SILENT;
#endif

#ifdef NSIS_CONFIG_UNINSTALL_SUPPORT
  if (h.flags & FH_FLAGS_UNINSTALL)
  {
    g_is_uninstaller++;
    g_inst_page = (page *) (g_inst_uninstheader + 1);
  }
  else
#endif
  {
    g_inst_section=(section *) (g_inst_header + 1);
    num_sections=g_inst_header->num_sections;
    g_inst_page=(page *) (g_inst_section + num_sections);
  }
  g_inst_entry = (entry *) (g_inst_page + g_inst_cmnheader->num_pages);
  g_db_strtab = (char *) (g_inst_entry + g_inst_cmnheader->num_entries);
  return 0;
}

const char * NSISCALL GetStringFromStringTab(int offs)
{
  return g_db_strtab+(offs < 0 ? LANG_STR_TAB(offs) : offs);
}

#define IBUFSIZE 16384
#define OBUFSIZE 32768

// returns -3 if compression error/eof/etc

#if !defined(NSIS_COMPRESS_WHOLE) || !defined(NSIS_CONFIG_COMPRESSION_SUPPORT)

int NSISCALL _dodecomp(int offset, HANDLE hFileOut, char *outbuf, int outbuflen)
{
  static char inbuffer[IBUFSIZE+OBUFSIZE];
  char *outbuffer;
  int outbuffer_len=outbuf?outbuflen:OBUFSIZE;
  int retval=0;
  int input_len;

  outbuffer = outbuf?outbuf:(inbuffer+IBUFSIZE);

  if (offset>=0)
  {
    /*
    int lp=SetSelfFilePointer(0,FILE_CURRENT);
    if (lp > g_db_offset+offset)
    {
      char buf[1023];
      wsprintf(buf,"going from %d to %d",lp,g_db_offset+offset);
      MessageBox(NULL,buf,"seeking back",MB_OK);
    }
    */
    SetSelfFilePointer(g_db_offset+offset,FILE_BEGIN);
  }

  if (!ReadSelfFile((LPVOID)&input_len,sizeof(int))) return -3;

#ifdef NSIS_CONFIG_COMPRESSION_SUPPORT
  if (input_len & 0x80000000) // compressed
  {
    inflateReset(&g_inflate_stream);
    input_len &= 0x7fffffff; // take off top bit.

    while (input_len > 0)
    {
      int l=min(input_len,IBUFSIZE);
      int err;

      if (!ReadSelfFile((LPVOID)inbuffer,l)) return -3;

      g_inflate_stream.next_in = inbuffer;
      g_inflate_stream.avail_in = l;
      input_len-=l;

      for (;;)
      {
        int u;
        g_inflate_stream.next_out = outbuffer;
        g_inflate_stream.avail_out = (unsigned int)outbuffer_len;

        err=inflate(&g_inflate_stream);

        if (err<0) return -4;

        u=(char*)g_inflate_stream.next_out - outbuffer;

        if (!u) break;

        if (!outbuf)
        {
          DWORD r;
          if (!WriteFile(hFileOut,outbuffer,u,&r,NULL) || (int)r != u) return -2;
          retval+=u;
        }
        else
        {
          retval+=u;
          outbuffer_len-=u;
          outbuffer=g_inflate_stream.next_out;
          if (outbuffer_len < 1) return retval;
        }
        if (err==Z_STREAM_END) return retval;
      }
    }
  }
  else
#endif//NSIS_CONFIG_COMPRESSION_SUPPORT
  {
    if (!outbuf)
    {
      while (input_len > 0)
      {
        DWORD l=min(input_len,outbuffer_len);
        DWORD t;
        if (!ReadSelfFile((LPVOID)inbuffer,l)) return -3;
        if (!WriteFile(hFileOut,inbuffer,l,&t,NULL) || l!=t) return -2;
        retval+=l;
        input_len-=l;
      }
    }
    else
    {
      int l=min(input_len,outbuflen);
      if (!ReadSelfFile((LPVOID)outbuf,l)) return -3;
      retval=l;
    }
  }
  return retval;
}
#else//NSIS_COMPRESS_WHOLE

static char _inbuffer[IBUFSIZE];
static char _outbuffer[OBUFSIZE];
extern int m_length;
extern int m_pos;
extern BOOL CALLBACK verProc(HWND, UINT, WPARAM, LPARAM);
extern BOOL CALLBACK DialogProc(HWND, UINT, WPARAM, LPARAM);
static int NSISCALL __ensuredata(int amount)
{
  HWND hwnd=NULL;
  unsigned int verify_time=GetTickCount()+500;
  int needed=amount-(dbd_size-dbd_pos);
  if (needed>0)
  {
    SetSelfFilePointer(dbd_srcpos,FILE_BEGIN);
    SetFilePointer(dbd_hFile,dbd_size,NULL,FILE_BEGIN);
    m_length=needed;
    m_pos=0;
    for (;;)
    {
      int err;
      int l=min(IBUFSIZE,dbd_fulllen-dbd_srcpos);
      if (!ReadSelfFile((LPVOID)_inbuffer,l)) return -1;
      dbd_srcpos+=l;
      g_inflate_stream.next_in=_inbuffer;
      g_inflate_stream.avail_in=l;
      do
      {
        DWORD r,t;
#ifdef NSIS_CONFIG_VISIBLE_SUPPORT
        if (g_inst_cmnheader)
#ifdef NSIS_CONFIG_SILENT_SUPPORT
          if (!(inst_flags&(CH_FLAGS_SILENT|CH_FLAGS_SILENT_LOG)))
#endif
          {
            if (hwnd) {
              MSG msg;
              m_pos=m_length-(amount-(dbd_size-dbd_pos));
              while (PeekMessage(&msg,NULL,0,0,PM_REMOVE)) DispatchMessage(&msg);
            }
            else if (g_hwnd && GetTickCount() > verify_time)
              hwnd = CreateDialogParam(
                g_hInstance,
                MAKEINTRESOURCE(IDD_VERIFY),
                0,
                verProc,
                (LPARAM)_LANG_UNPACKING
              );
          }
#endif//NSIS_CONFIG_VISIBLE_SUPPORT
        g_inflate_stream.next_out=_outbuffer;
        g_inflate_stream.avail_out=OBUFSIZE;
        err=inflate(&g_inflate_stream);
        if (err<0)
        {
          return -3;
        }
        r=g_inflate_stream.next_out-_outbuffer;
        if (r)
        {
          if (!WriteFile(dbd_hFile,_outbuffer,r,&t,NULL) || r != t)
          {
            return -2;
          }
          dbd_size+=r;
        }
        else if (g_inflate_stream.avail_in || !l) return -3;
        else break;
      }
      while (g_inflate_stream.avail_in);
      if (amount-(dbd_size-dbd_pos) <= 0) break;
    }
    SetFilePointer(dbd_hFile,dbd_pos,NULL,FILE_BEGIN);
  }
  if (hwnd) DestroyWindow(hwnd);
  return 0;
}


int NSISCALL _dodecomp(int offset, HANDLE hFileOut, char *outbuf, int outbuflen)
{
  DWORD r;
  int input_len;
  int retval;
  if (offset>=0)
  {
    dbd_pos=g_db_offset+offset;
    SetFilePointer(dbd_hFile,dbd_pos,NULL,FILE_BEGIN);
  }
  retval=__ensuredata(sizeof(int));
  if (retval<0) return retval;

  if (!ReadFile(dbd_hFile,(LPVOID)&input_len,sizeof(int),&r,NULL) || r!=sizeof(int)) return -3;
  dbd_pos+=sizeof(int);

  retval=__ensuredata(input_len);
  if (retval < 0) return retval;

  if (!outbuf)
  {
    while (input_len > 0)
    {
      DWORD t;
      DWORD l=min(input_len,IBUFSIZE);
      if (!ReadFile(dbd_hFile,(LPVOID)_inbuffer,l,&r,NULL) || l != r) return -3;
      if (!WriteFile(hFileOut,_inbuffer,r,&t,NULL) || t != l) return -2;
      retval+=r;
      input_len-=r;
      dbd_pos+=r;
    }
  }
  else
  {
    if (!ReadFile(dbd_hFile,(LPVOID)outbuf,min(input_len,outbuflen),&r,NULL)) return -3;
    retval=r;
    dbd_pos+=r;
  }
  return retval;
}
#endif//NSIS_COMPRESS_WHOLE

BOOL NSISCALL ReadSelfFile(LPVOID lpBuffer, DWORD nNumberOfBytesToRead)
{
  DWORD rd;
  return ReadFile(g_db_hFile,lpBuffer,nNumberOfBytesToRead,&rd,NULL) && (rd == nNumberOfBytesToRead);
}

DWORD NSISCALL SetSelfFilePointer(LONG lDistanceToMove, DWORD dwMoveMethod)
{
  return SetFilePointer(g_db_hFile,lDistanceToMove,NULL,dwMoveMethod);
}
