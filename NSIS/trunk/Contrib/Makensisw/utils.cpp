/*
  Copyright (c) 2002 Robert Rainwater
  Contributors: Justin Frankel, Fritz Elfert, Amir Szekely, and Sunil Kamath

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

*/
#include <windows.h>
#include "resource.h"
#include "makensisw.h"
#include "toolbar.h"
#include "noclib.h"

NTOOLTIP g_tip;
LRESULT CALLBACK TipHookProc(int nCode, WPARAM wParam, LPARAM lParam);

char g_mru_list[MRU_LIST_SIZE][MAX_PATH] = { NULL, NULL, NULL, NULL, NULL };

extern NSCRIPTDATA g_sdata;

int SetArgv(char *cmdLine, int *argc, char ***argv)
{
	char *p, *arg, *argSpace;
	int size, argSpaceSize, inquote, copy, slashes;

	size = 2;
	for (p = cmdLine; *p != '\0'; p++) {
		if ((*p == ' ') || (*p == '\t')) {
			size++;
			while ((*p == ' ') || (*p == '\t')) {
				p++;
			}
			if (*p == '\0') {
				break;
			}
		}
	}

  argSpaceSize = size * sizeof(char *) + lstrlen(cmdLine) + 1;
	argSpace = (char *) LocalAlloc(GMEM_FIXED, argSpaceSize);
	*argv = (char **) argSpace;
	argSpace += size * sizeof(char *);
	size--;

	p = cmdLine;
	for (*argc = 0; *argc < size; (*argc)++) {
		(*argv)[*argc] = arg = argSpace;
		while ((*p == ' ') || (*p == '\t')) {
			p++;
		}
		if (*p == '\0') {
			break;
		}

		inquote = 0;
		slashes = 0;
		while (1) {
			copy = 1;
			while (*p == '\\') {
				slashes++;
				p++;
			}
			if (*p == '"') {
				if ((slashes & 1) == 0) {
					copy = 0;
					if ((inquote) && (p[1] == '"')) {
						p++;
						copy = 1;
					}
					else {
						inquote = !inquote;
					}
				}
				slashes >>= 1;
			}

			while (slashes) {
				*arg = '\\';
				arg++;
				slashes--;
			}

			if ((*p == '\0') || (!inquote && ((*p == ' ') || (*p == '\t')))) {
				break;
			}
			if (copy != 0) {
				*arg = *p;
				arg++;
			}
			p++;
		}
		*arg = '\0';
		argSpace = arg + 1;
	}
	(*argv)[*argc] = NULL;

  return argSpaceSize;
}

void SetTitle(HWND hwnd,char *substr) {
  char title[64];
  if (substr==NULL) wsprintf(title,"MakeNSISW");
  else wsprintf(title,"MakeNSISW - %s",substr);
  SetWindowText(hwnd,title);
}

void SetBranding(HWND hwnd) {
  SetDlgItemText(hwnd, IDC_VERSION, g_sdata.branding);
}

void CopyToClipboard(HWND hwnd) {
  if (!hwnd||!OpenClipboard(hwnd)) return;
  int len=SendDlgItemMessage(hwnd,IDC_LOGWIN,WM_GETTEXTLENGTH,0,0);
  HGLOBAL mem = GlobalAlloc(GMEM_MOVEABLE,len+1);
  if (!mem) { CloseClipboard(); return; }
  char *existing_text = (char *)GlobalLock(mem);
  if (!existing_text) { CloseClipboard(); return; }
  EmptyClipboard();
  existing_text[0]=0;
  GetDlgItemText(hwnd, IDC_LOGWIN, existing_text, len+1);
  GlobalUnlock(mem);
  SetClipboardData(CF_TEXT,mem);
  CloseClipboard();
}

void ClearLog(HWND hwnd) {
  SetDlgItemText(hwnd, IDC_LOGWIN, "");
}

void LogMessage(HWND hwnd,const char *str) {
  SendDlgItemMessage(hwnd, IDC_LOGWIN, EM_SETSEL, g_sdata.logLength, g_sdata.logLength);
  g_sdata.logLength += lstrlen(str);
  SendDlgItemMessage(hwnd, IDC_LOGWIN, EM_REPLACESEL, 0, (WPARAM)str);
  SendDlgItemMessage(hwnd, IDC_LOGWIN, EM_SCROLLCARET, 0, 0);
}

void ErrorMessage(HWND hwnd,const char *str) {
  if (!str) return;
  char buf[1028];
  wsprintf(buf,"[Error] %s\r\n",str);
  LogMessage(hwnd,buf);
}

// Altered by Darren Owen (DrO) on 1/10/2003
void Items(HWND hwnd, int on){
  UINT mf = (!on ? MF_GRAYED : MF_ENABLED);

  if(!on)
      g_sdata.focused_hwnd = GetFocus();
  // Altered by Darren Owen (DrO) on 6/10/2003
  else
    EnableWindow(GetDlgItem(hwnd,IDC_CLOSE),1);

  EnableWindow(GetDlgItem(hwnd,IDC_CLOSE),on);
  // Altered by Darren Owen (DrO) on 6/10/2003
  if((!g_sdata.retcode && on) || !on)
    EnableWindow(GetDlgItem(hwnd,IDC_TEST),on);
  EnableWindow(GetDlgItem(hwnd,IDC_RECOMPILE_TEST),on);

  EnableMenuItem(g_sdata.menu,IDM_SAVE,mf);
  // Altered by Darren Owen (DrO) on 6/10/2003
  if((!g_sdata.retcode && on) || !on)
    EnableMenuItem(g_sdata.menu,IDM_TEST,mf);
  EnableMenuItem(g_sdata.menu,IDM_EXIT,mf);
  EnableMenuItem(g_sdata.menu,IDM_LOADSCRIPT,mf);
  EnableMenuItem(g_sdata.menu,IDM_RECOMPILE,mf);
  EnableMenuItem(g_sdata.menu,IDM_COPY,mf);
  EnableMenuItem(g_sdata.menu,IDM_COPYSELECTED,mf);
  EnableMenuItem(g_sdata.menu,IDM_EDITSCRIPT,mf);
  EnableMenuItem(g_sdata.menu,IDM_CLEARLOG,mf);
  EnableMenuItem(g_sdata.menu,IDM_BROWSESCR,mf);
  EnableMenuItem(g_sdata.menu,IDM_RECOMPILE_TEST,mf);
  EnableMenuItem(g_sdata.menu,IDM_COMPRESSOR,mf);

  EnableToolBarButton(IDM_SAVE,on);
  // Altered by Darren Owen (DrO) on 6/10/2003
  if((!g_sdata.retcode && on) || !on)
    EnableToolBarButton(IDM_TEST,on);
  EnableToolBarButton(IDM_EXIT,on);
  EnableToolBarButton(IDM_LOADSCRIPT,on);
  EnableToolBarButton(IDM_RECOMPILE,on);
  EnableToolBarButton(IDM_COPY,on);
  EnableToolBarButton(IDM_EDITSCRIPT,on);
  EnableToolBarButton(IDM_CLEARLOG,on);
  EnableToolBarButton(IDM_BROWSESCR,on);
  EnableToolBarButton(IDM_RECOMPILE_TEST,on);
  EnableToolBarButton(IDM_COMPRESSOR,on);

  if(!on) {
    if (!IsWindowEnabled(g_sdata.focused_hwnd))
      SetFocus(GetDlgItem(hwnd,IDC_LOGWIN));
  }
  else
    SetFocus(g_sdata.focused_hwnd);
}

void SetCompressorStats()
{
  DWORD line_count, i;
  char buf[1024];
  bool found = false;

  line_count = SendDlgItemMessage(g_sdata.hwnd, IDC_LOGWIN, EM_GETLINECOUNT, 0, 0);
  for(i=0; i<line_count; i++) {
    *((LPWORD)buf) = sizeof(buf); 
    SendDlgItemMessage(g_sdata.hwnd, IDC_LOGWIN, EM_GETLINE, (WPARAM)i, (LPARAM)buf);
    if(found) {
      DWORD len = lstrlen(TOTAL_SIZE_COMPRESSOR_STAT);
      lstrcat(g_sdata.compressor_stats,buf);

      if(!lstrncmp(buf,TOTAL_SIZE_COMPRESSOR_STAT,len)) {
        break;
      }
    }
    else {
      DWORD len = lstrlen(EXE_HEADER_COMPRESSOR_STAT);
      if(!lstrncmp(buf,EXE_HEADER_COMPRESSOR_STAT,len)) {
        found = true;
        lstrcpy(g_sdata.compressor_stats,"\n\n");
        lstrcat(g_sdata.compressor_stats,buf);
      }
    }
  }
}

void CompileNSISScript() {
  static char *s;
  DragAcceptFiles(g_sdata.hwnd,FALSE);
  ClearLog(g_sdata.hwnd);
  SetTitle(g_sdata.hwnd,NULL);
  if (lstrlen(g_sdata.script)==0) {
    LogMessage(g_sdata.hwnd,USAGE);
    EnableMenuItem(g_sdata.menu,IDM_RECOMPILE,MF_GRAYED);
    EnableMenuItem(g_sdata.menu,IDM_EDITSCRIPT,MF_GRAYED);
    EnableMenuItem(g_sdata.menu,IDM_TEST,MF_GRAYED);
    EnableMenuItem(g_sdata.menu,IDM_BROWSESCR,MF_GRAYED);
    // Added by Darren Owen (DrO) on 1/10/2003
    EnableMenuItem(g_sdata.menu,IDM_RECOMPILE_TEST,MF_GRAYED);

    EnableToolBarButton(IDM_RECOMPILE,FALSE);
    EnableToolBarButton(IDM_EDITSCRIPT,FALSE);
    EnableToolBarButton(IDM_TEST,FALSE);
    EnableToolBarButton(IDM_RECOMPILE_TEST,FALSE);
    EnableToolBarButton(IDM_BROWSESCR,FALSE);

    EnableWindow(GetDlgItem(g_sdata.hwnd,IDC_TEST),0);
    DragAcceptFiles(g_sdata.hwnd,TRUE);
    return;
  }
  if (!g_sdata.appended) {
    if (s) GlobalFree(s);
    char *defines = BuildDefines();
    
    char compressor[40];
    if(lstrlen(g_sdata.compressor_name)) {
      wsprintf(compressor,"/X\"SetCompressor /FINAL %s\" ",g_sdata.compressor_name);
    }
    else {
      lstrcpy(compressor,"");
    }

    s = (char *)GlobalAlloc(GPTR, lstrlen(g_sdata.script)+lstrlen(defines)+lstrlen(compressor)+sizeof(EXENAME)+sizeof(" /NOTIFYHWND  ")+20);
    wsprintf(s,"%s %s%s /NOTIFYHWND %d %s",EXENAME,compressor,defines,g_sdata.hwnd,g_sdata.script);
    GlobalFree(defines);
    if (g_sdata.script_alloced) GlobalFree(g_sdata.script);
    g_sdata.script_alloced = true;
    g_sdata.script = s;
    g_sdata.appended = TRUE;
  }
  GlobalFree(g_sdata.input_script);
  GlobalFree(g_sdata.output_exe);
  g_sdata.input_script = 0;
  g_sdata.output_exe = 0;
  g_sdata.warnings = 0;
  g_sdata.logLength = 0;
  // Disable buttons during compile
  DisableItems(g_sdata.hwnd);
  DWORD id;
  g_sdata.thread=CreateThread(NULL,0,MakeNSISProc,0,0,&id);
}

void RestoreWindowPos(HWND hwnd) {
  HKEY hKey;
  WINDOWPLACEMENT p;
  if (RegOpenKeyEx(REGSEC,REGKEY,0,KEY_READ,&hKey) == ERROR_SUCCESS) {
    DWORD l = sizeof(p);
    DWORD t;
    if ((RegQueryValueEx(hKey,REGLOC,NULL,&t,(unsigned char*)&p,&l)==ERROR_SUCCESS)&&(t == REG_BINARY)&&(l==sizeof(p))) {
      p.length = sizeof(p);
      SetWindowPlacement(hwnd, &p);
    }
    RegCloseKey(hKey);
  }
}

void SaveWindowPos(HWND hwnd) {
  HKEY hKey;
  WINDOWPLACEMENT p;
  p.length = sizeof(p);
  GetWindowPlacement(hwnd, &p);
  if (RegCreateKey(REGSEC,REGKEY,&hKey) == ERROR_SUCCESS) {
    RegSetValueEx(hKey,REGLOC,0,REG_BINARY,(unsigned char*)&p,sizeof(p));
    RegCloseKey(hKey);
  }
}

void RestoreDefines()
{
    HKEY hKey;
    HKEY hSubKey;
    if (RegOpenKeyEx(REGSEC,REGKEY,0,KEY_READ,&hKey) == ERROR_SUCCESS) {
        int n = 0;
        DWORD l = sizeof(n);
        DWORD t;
        if ((RegQueryValueEx(hKey,REGDEFCOUNT,NULL,&t,(unsigned char*)&n,&l)==ERROR_SUCCESS)&&(t == REG_DWORD)&&(l==sizeof(n))) {
            if(n > 0) {
                if (RegCreateKey(hKey,REGDEFSUBKEY,&hSubKey) == ERROR_SUCCESS) {
                    char buf[8];
                    g_sdata.defines = (char **)GlobalAlloc(GPTR, (n+1)*sizeof(char *));
                    for(int i=0; i<n; i++) {
                        wsprintf(buf,"%d",i);
                        l = 0;
                        if ((RegQueryValueEx(hSubKey,buf,NULL,&t,NULL,&l)==ERROR_SUCCESS)&&(t == REG_SZ)) {
                            l++;
                            g_sdata.defines[i] = (char *)GlobalAlloc(GPTR, l*sizeof(char));
                            RegQueryValueEx(hSubKey,buf,NULL,&t,(unsigned char*)g_sdata.defines[i],&l);
                        }
                    }
                    g_sdata.defines[n] = NULL;
                    RegCloseKey(hSubKey);
                }
            }
        }
        RegCloseKey(hKey);
    }
}

void SaveDefines()
{
    HKEY hKey;
    HKEY hSubKey;
    int n = 0;
    if (RegCreateKey(REGSEC,REGKEY,&hKey) == ERROR_SUCCESS) {
        RegDeleteKey(hKey,REGDEFSUBKEY);
        if(g_sdata.defines) {
          if (RegCreateKey(hKey,REGDEFSUBKEY,&hSubKey) == ERROR_SUCCESS) {
              char buf[8];
              while(g_sdata.defines[n]) {
                  wsprintf(buf,"%d",n);
                  RegSetValueEx(hSubKey,buf,0,REG_SZ,(CONST BYTE *)g_sdata.defines[n],lstrlen(g_sdata.defines[n]));
                  n++;
              }
              RegCloseKey(hSubKey);
          }
        }
        RegSetValueEx(hKey,REGDEFCOUNT,0,REG_DWORD,(CONST BYTE *)&n,sizeof(n));
        RegCloseKey(hKey);
    }
}

void ResetObjects() {
  g_sdata.appended = FALSE;
  g_sdata.warnings = FALSE;
  g_sdata.retcode = -1;
  g_sdata.thread = NULL;
}

void ResetDefines() {
  if(g_sdata.defines) {
    int i=0;
    while(g_sdata.defines[i]) {
      GlobalFree(g_sdata.defines[i]);
      i++;
    }
    GlobalFree(g_sdata.defines);
    g_sdata.defines = NULL;
  }
}

int InitBranding() {
  char *s;
  s = (char *)GlobalAlloc(GPTR,lstrlen(EXENAME)+10);
  wsprintf(s,"%s /version",EXENAME);
  {
    STARTUPINFO si={sizeof(si),};
    SECURITY_ATTRIBUTES sa={sizeof(sa),};
    SECURITY_DESCRIPTOR sd={0,};
    PROCESS_INFORMATION pi={0,};
    HANDLE newstdout=0,read_stdout=0; 

    OSVERSIONINFO osv={sizeof(osv)};
    GetVersionEx(&osv);
    if (osv.dwPlatformId == VER_PLATFORM_WIN32_NT) {
      InitializeSecurityDescriptor(&sd,SECURITY_DESCRIPTOR_REVISION);
      SetSecurityDescriptorDacl(&sd,true,NULL,false);
      sa.lpSecurityDescriptor = &sd;
    }
    else sa.lpSecurityDescriptor = NULL;
    sa.bInheritHandle = true;
    if (!CreatePipe(&read_stdout,&newstdout,&sa,0)) {
      return 0;
    }
    GetStartupInfo(&si);
    si.dwFlags = STARTF_USESTDHANDLES|STARTF_USESHOWWINDOW;
    si.wShowWindow = SW_HIDE;
    si.hStdOutput = newstdout;
    si.hStdError = newstdout;
    if (!CreateProcess(NULL,s,NULL,NULL,TRUE,CREATE_NEW_CONSOLE,NULL,NULL,&si,&pi)) {
      CloseHandle(newstdout);
      CloseHandle(read_stdout);
      return 0;
    }
    char szBuf[1024];
    DWORD dwRead = 1;
    DWORD dwExit = !STILL_ACTIVE;
    if (WaitForSingleObject(pi.hProcess,10000)!=WAIT_OBJECT_0) {
      return 0;
    }
    ReadFile(read_stdout, szBuf, sizeof(szBuf)-1, &dwRead, NULL);
    szBuf[dwRead] = 0;
    if (lstrlen(szBuf)==0) return 0;
    g_sdata.branding = (char *)GlobalAlloc(GPTR,lstrlen(szBuf)+6);
    wsprintf(g_sdata.branding,"NSIS %s",szBuf);
    g_sdata.brandingv = (char *)GlobalAlloc(GPTR,lstrlen(szBuf)+1);
    lstrcpy(g_sdata.brandingv,szBuf);
    GlobalFree(s);
  }
  return 1;
}

void InitTooltips(HWND h) {
  if (h == NULL)  return;
  my_memset(&g_tip,0,sizeof(NTOOLTIP));
  g_tip.tip_p = h;
  INITCOMMONCONTROLSEX icx;
  icx.dwSize  = sizeof(icx);
  icx.dwICC  = ICC_BAR_CLASSES;
  InitCommonControlsEx(&icx);
  DWORD dwStyle = WS_POPUP | WS_BORDER | TTS_ALWAYSTIP;
  DWORD dwExStyle = WS_EX_TOOLWINDOW | WS_EX_TOPMOST;
  g_tip.tip = CreateWindowEx(dwExStyle,TOOLTIPS_CLASS,NULL,dwStyle,0,0,0,0,h,NULL,GetModuleHandle(NULL),NULL);
  if (!g_tip.tip) return;
  g_tip.hook = SetWindowsHookEx(WH_GETMESSAGE,TipHookProc,NULL, GetCurrentThreadId());
  AddTip(GetDlgItem(h,IDC_CLOSE),TEXT("Close MakeNSISW"));
  AddTip(GetDlgItem(h,IDC_TEST),TEXT("Test the installer generated by MakeNSISW"));
  AddToolBarTooltips();
}

void DestroyTooltips() {
  UnhookWindowsHookEx(g_tip.hook);
}

void AddTip(HWND hWnd,LPSTR lpszToolTip) {
  TOOLINFO ti;
  ti.cbSize = sizeof(TOOLINFO);
  ti.uFlags = TTF_IDISHWND;
  ti.hwnd   = g_tip.tip_p;
  ti.uId = (UINT) hWnd;
  ti.lpszText = lpszToolTip;
  SendMessage(g_tip.tip, TTM_ADDTOOL, 0, (LPARAM) (LPTOOLINFO) &ti); 
}

LRESULT CALLBACK TipHookProc(int nCode, WPARAM wParam, LPARAM lParam) {
  if (nCode < 0) return CallNextHookEx(g_tip.hook, nCode, wParam, lParam); 
  switch (((MSG*)lParam)->message) { 
    case WM_MOUSEMOVE:
      if (IsChild(g_tip.tip_p,((MSG*)lParam)->hwnd)) 
        SendMessage(g_tip.tip, TTM_RELAYEVENT, 0,lParam); 
      break; 
    default: 
      break; 
  } 
  return CallNextHookEx(g_tip.hook, nCode, wParam, lParam); 
}

void ShowDocs() {
  char pathf[MAX_PATH],*path;
  GetModuleFileName(NULL,pathf,sizeof(pathf));
  path=my_strrchr(pathf,'\\');
  if(path!=NULL) *path=0;
  lstrcat(pathf,LOCALDOCS);
  if ((int)ShellExecute(g_sdata.hwnd,"open",pathf,NULL,NULL,SW_SHOWNORMAL)<=32) 
  ShellExecute(g_sdata.hwnd,"open",DOCPATH,NULL,NULL,SW_SHOWNORMAL);
}

char* BuildDefines()
{
  char *buf = NULL;

  if(g_sdata.defines) {
    int i=0;
    while(g_sdata.defines[i]) {
      if(buf) {
        char *buf3 = (char *)GlobalAlloc(GPTR,(lstrlen(buf)+lstrlen(g_sdata.defines[i])+6)*sizeof(char));
        wsprintf(buf3,"%s \"/D%s\"",buf,g_sdata.defines[i]);
        GlobalFree(buf);
        buf = buf3;
      }
      else {
        buf = (char *)GlobalAlloc(GPTR,(lstrlen(g_sdata.defines[i])+5)*sizeof(char));
        wsprintf(buf,"\"/D%s\"",g_sdata.defines[i]);
      }
      i++;
    }
  }
  else {
    buf = (char *)GlobalAlloc(GPTR, sizeof(char));
    lstrcpy(buf,"");
  }

  return buf;
}

BOOL PopMRUFile(char* fname)
{
  int i;

  for(i=0; i<MRU_LIST_SIZE; i++) {
    if(!lstrcmpi(g_mru_list[i], fname)) {
      break;
    }
  }

  if(i < MRU_LIST_SIZE) {
    int j;
    for(j = i; j < MRU_LIST_SIZE-1; j++) {
      lstrcpy(g_mru_list[j],g_mru_list[j+1]);
    }
    g_mru_list[MRU_LIST_SIZE-1][0]='\0';
    return TRUE;
  }
  else {
    return FALSE;
  }
}

BOOL IsValidFile(char *fname)
{
  WIN32_FIND_DATA wfd;
  HANDLE h;

  h = FindFirstFile(fname,&wfd);
  if(h != INVALID_HANDLE_VALUE) {
    FindClose(h);
    return true;
  }
  return false;
}

void PushMRUFile(char* fname)
{
  int i;
  char buf[MAX_PATH+1];
  DWORD   rv;
  char*  file_part;
  char full_file_name[MAX_PATH+1];

  if(!fname || fname[0] == '\0' || fname[0] == '/' || fname[0] == '-') {
    return;
  }

  if(fname[0] == '"') {
    fname++;
  }

  lstrcpy(buf,fname);
  if(buf[lstrlen(buf)-1] == '"') {
    buf[lstrlen(buf)-1] = '\0';
  }
  my_memset(full_file_name,0,sizeof(full_file_name));
  rv = GetFullPathName(buf,sizeof(full_file_name),full_file_name,&file_part);
  if (rv == 0) {
    return;
  }

  if(IsValidFile(full_file_name)) {
    PopMRUFile(full_file_name);
    for(i = MRU_LIST_SIZE - 2; i >= 0; i--) {
      lstrcpy(g_mru_list[i+1], g_mru_list[i]);
    }
    lstrcpy(g_mru_list[0],full_file_name);
    BuildMRUMenus();
  }
}

void BuildMRUMenus()
{
  HMENU hMenu = g_sdata.fileSubmenu;
  int i;
  MENUITEMINFO mii;
  char buf[MRU_DISPLAY_LENGTH+1];
  char buf2[MRU_DISPLAY_LENGTH - 6];
  int n;

  for(i = 0; i < MRU_LIST_SIZE; i++) {
    DeleteMenu(hMenu, IDM_MRU_FILE+i, MF_BYCOMMAND);
  }

  n = GetMenuItemCount(hMenu);

  for(i = 0; i < MRU_LIST_SIZE; i++) {
    if(g_mru_list[i][0]) {
      my_memset(buf,0,sizeof(buf));
      my_memset(&mii, 0, sizeof(mii));
      mii.cbSize = sizeof(mii);
      mii.fMask = MIIM_ID | MIIM_TYPE | MIIM_STATE;
      mii.wID = IDM_MRU_FILE+i;
      mii.fType = MFT_STRING;
      if(lstrlen(g_mru_list[i]) > MRU_DISPLAY_LENGTH) {
        char *p = my_strrchr(g_mru_list[i],'\\');
        if(p) {
          p++;
          if(lstrlen(p) > MRU_DISPLAY_LENGTH - 7) {
            my_memset(buf2,0,sizeof(buf2));
            lstrcpyn(buf2,p,MRU_DISPLAY_LENGTH - 9);
            lstrcat(buf2,"...");

            lstrcpyn(buf,g_mru_list[i],4);
            lstrcat(buf,"...\\");
            lstrcat(buf,buf2);
          }
          else {
            lstrcpyn(buf,g_mru_list[i],(MRU_DISPLAY_LENGTH - lstrlen(p) - 3));
            lstrcat(buf,"...\\");
            lstrcat(buf,p);
          }
        }
        else {
          lstrcpyn(buf,g_mru_list[i],(MRU_DISPLAY_LENGTH-2));
          lstrcat(buf,"...");
        }
      }
      else {
        lstrcpy(buf, g_mru_list[i]);
      }

      mii.dwTypeData = buf;
      mii.cch = lstrlen(buf)+1;
      mii.fState = MFS_ENABLED;
      InsertMenuItem(hMenu, n++, TRUE, &mii);

    }
    else {
      break;
    }
  }

  hMenu = g_sdata.toolsSubmenu;
  my_memset(&mii, 0, sizeof(mii));
  mii.cbSize = sizeof(mii);
  mii.fMask = MIIM_STATE;

  if(g_mru_list[0][0]) {
    mii.fState = MFS_ENABLED;
  }
  else {
    mii.fState = MFS_GRAYED;
  }

  SetMenuItemInfo(hMenu, IDM_CLEAR_MRU_LIST,FALSE,&mii);
}

void LoadMRUFile(int position)
{
  if (!g_sdata.thread && position >=0 && position < MRU_LIST_SIZE && g_mru_list[position][0]) {
    g_sdata.script = (char *)GlobalAlloc(GPTR,lstrlen(g_mru_list[position])+3);
    wsprintf(g_sdata.script,"\"%s\"",g_mru_list[position]);
    if(IsValidFile(g_mru_list[position])) {
      PushMRUFile(g_mru_list[position]);
    }
    else {
      PopMRUFile(g_mru_list[position]);
      BuildMRUMenus();
    }
    ResetObjects();
    CompileNSISScript();
  }
}

void RestoreMRUList()
{
    HKEY hKey;
    HKEY hSubKey;
    int n = 0;
    int i;
    if (RegOpenKeyEx(REGSEC,REGKEY,0,KEY_READ,&hKey) == ERROR_SUCCESS) {
        if (RegCreateKey(hKey,REGMRUSUBKEY,&hSubKey) == ERROR_SUCCESS) {
            char buf[8];
            DWORD l;
            for(int i=0; i<MRU_LIST_SIZE; i++) {
                wsprintf(buf,"%d",i);
                l = sizeof(g_mru_list[n]);
                RegQueryValueEx(hSubKey,buf,NULL,NULL,(unsigned char*)g_mru_list[n],&l);
                if(g_mru_list[n][0] != '\0') {
                  n++;
                }
            }
            RegCloseKey(hSubKey);
        }
        RegCloseKey(hKey);
    }
    for(i = n; i < MRU_LIST_SIZE; i++) {
      g_mru_list[i][0] = '\0';
    }

    BuildMRUMenus();
}

void SaveMRUList()
{
    HKEY hKey;
    HKEY hSubKey;
    int i = 0;
    if (RegCreateKey(REGSEC,REGKEY,&hKey) == ERROR_SUCCESS) {
        if (RegCreateKey(hKey,REGMRUSUBKEY,&hSubKey) == ERROR_SUCCESS) {
            char buf[8];
            for(i = 0; i < MRU_LIST_SIZE; i++) {
                wsprintf(buf,"%d",i);
                RegSetValueEx(hSubKey,buf,0,REG_SZ,(const unsigned char *)g_mru_list[i],lstrlen(g_mru_list[i]));
            }
            RegCloseKey(hSubKey);
        }
        RegCloseKey(hKey);
    }
}

void ClearMRUList()
{
  int i;
  for(i=0; i<MRU_LIST_SIZE; i++) {
    g_mru_list[i][0] = '\0';
  }

  BuildMRUMenus();
}

void RestoreCompressor()
{
  HKEY hKey;
  NCOMPRESSOR v = COMPRESSOR_DEFAULT;
  if (RegOpenKeyEx(REGSEC,REGKEY,0,KEY_READ,&hKey) == ERROR_SUCCESS) {
    DWORD l = sizeof(g_sdata.compressor);
    DWORD t;
    if ((RegQueryValueEx(hKey,REGCOMPRESSOR,NULL,&t,(unsigned char*)&v,&l)==ERROR_SUCCESS) &&
        (t == REG_DWORD) &&
        (l==sizeof(v))) {
    }
    RegCloseKey(hKey);
  }
  g_sdata.command_line_compressor = false;
  SetCompressor(v);
}

void SaveCompressor()
{
  if(!g_sdata.command_line_compressor) {
    HKEY hKey;
    NCOMPRESSOR v = g_sdata.compressor;
    if (RegCreateKey(REGSEC,REGKEY,&hKey) == ERROR_SUCCESS) {
      RegSetValueEx(hKey,REGCOMPRESSOR,0,REG_DWORD,(unsigned char*)&v,sizeof(v));
      RegCloseKey(hKey);
    }
  }
}

BOOL FileExists(char *fname)
{
  WIN32_FIND_DATA wfd;
  HANDLE h;

  h = FindFirstFile(fname,&wfd);
  if(h == INVALID_HANDLE_VALUE) {
    return false;
  }
  else {
    FindClose(h);
    return true;
  }
}
