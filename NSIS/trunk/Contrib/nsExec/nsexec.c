#include <windows.h>
#include <commctrl.h>
#include "nsexec.h"

#ifndef true
#define true TRUE
#endif
#ifndef false
#define false FALSE
#endif

HINSTANCE	g_hInstance;
HWND		g_hwndParent;
HWND		g_hwndList;
HWND		g_hwndDlg;
char		g_exec[MAX_PATH];
BOOL		g_done;
BOOL		g_foundto;
int			g_to;

int LogMessage(const char *pStr);
char *my_strstr(const char *string, const char *strCharSet);
int my_atoi(char *s);

void __declspec(dllexport) Exec(HWND hwndParent, int string_size, char *variables, stack_t **stacktop) {
	g_hwndParent=hwndParent;
	g_stringsize=string_size;
	g_stacktop=stacktop;
	g_variables=variables;
	{
		g_to = 100000;
		g_foundto = FALSE;
		g_hwndDlg = FindWindowEx(g_hwndParent,NULL,"#32770",NULL);
		g_hwndList = FindWindowEx(g_hwndDlg,NULL,"SysListView32",NULL);

		if (!g_foundto&&!popstring(g_exec)) {
			STARTUPINFO si={sizeof(si),};
			SECURITY_ATTRIBUTES sa={sizeof(sa),};
			SECURITY_DESCRIPTOR sd={0,};
			PROCESS_INFORMATION pi={0,};
			OSVERSIONINFO osv={sizeof(osv)};
			HANDLE newstdout=0,read_stdout=0;
			DWORD dwRead = 1;
			DWORD dwExit = !STILL_ACTIVE;
			HGLOBAL memory;
			char *szBuf;
			GetVersionEx(&osv);
			if (osv.dwPlatformId == VER_PLATFORM_WIN32_NT) {
				InitializeSecurityDescriptor(&sd,SECURITY_DESCRIPTOR_REVISION);
				SetSecurityDescriptorDacl(&sd,true,NULL,false);
				sa.lpSecurityDescriptor = &sd;
			}
			else sa.lpSecurityDescriptor = NULL;
			sa.bInheritHandle = true;
			if (!CreatePipe(&read_stdout,&newstdout,&sa,0)) {
				pushstring("");
				pushstring("error");
				return;
			}
			GetStartupInfo(&si);
			si.dwFlags = STARTF_USESTDHANDLES|STARTF_USESHOWWINDOW;
			si.wShowWindow = SW_HIDE;
			si.hStdOutput = newstdout;
			si.hStdError = newstdout;
			if (!CreateProcess(NULL,g_exec,NULL,NULL,TRUE,CREATE_NEW_CONSOLE,NULL,NULL,&si,&pi)) {
				CloseHandle(newstdout);
				CloseHandle(read_stdout);
				pushstring("");
				pushstring("error");
			}
			WaitForSingleObject(pi.hProcess,INFINITE);
			PeekNamedPipe(read_stdout, 0, 0, 0, &dwRead, NULL);
			memory = GlobalAlloc(GMEM_MOVEABLE,dwRead+1);
			szBuf = (char *)GlobalLock(memory);
			ReadFile(read_stdout, szBuf, dwRead, &dwRead, NULL);
			pushstring(szBuf);
			pushstring("success");
			if (my_strstr(szBuf,"\r\n")) {
				while (szBuf&&*szBuf) {
					char *i = my_strstr(szBuf,"\r\n");
					if (!i) {
						LogMessage(szBuf);
						break;
					}
					*i=0;
					LogMessage(szBuf);
					szBuf = i+2;
				}
			}
			else if (my_strstr(szBuf,"\n")) {
				MessageBox(0,"n","n",MB_OK);
			}
			else {
				LogMessage(szBuf);
			}
			GlobalFree(szBuf);
			CloseHandle(pi.hThread);
			CloseHandle(pi.hProcess);
			CloseHandle(newstdout);
			CloseHandle(read_stdout);
		}
		pushstring("");
		pushstring("error");
	}
}

BOOL WINAPI _DllMainCRTStartup(HANDLE hInst, ULONG ul_reason_for_call, LPVOID lpReserved) {
	g_hInstance=hInst;
	return TRUE;
}

// code I stole (err borrowed) from Tim Kosse
// all credits/problems are his
int LogMessage(const char *pStr) {
	LVITEM item={0};
	int nItemCount;
	if (!g_hwndList) return -1;
	nItemCount=SendMessage(g_hwndList, LVM_GETITEMCOUNT, 0, 0);
	item.mask=LVIF_TEXT;
	item.pszText=(char *)pStr;
	item.cchTextMax=6;
	item.iItem=nItemCount;
	ListView_InsertItem(g_hwndList, &item);
    ListView_EnsureVisible(g_hwndList, item.iItem, 0);
    return 0;
}


char *my_strstr(const char *string, const char *strCharSet) {
	char *s1, *s2;
	size_t chklen;
	size_t i;
	if (!*strCharSet) return (char*)string;
	chklen=lstrlen(string)-lstrlen(strCharSet);
	for (i = 0; i < chklen; i++) {
		s1=&((char*)string)[i];
		s2=(char*)strCharSet;
		while (*s1++ == *s2++)
			if (!*s2)
				return &((char*)string)[i];
	}
	return 0;
}

int my_atoi(char *s)
{
  unsigned int v=0;
  if (*s == '0' && (s[1] == 'x' || s[1] == 'X'))
  {
    s+=2;
    for (;;)
    {
      int c=*s++;
      if (c >= '0' && c <= '9') c-='0';
      else if (c >= 'a' && c <= 'f') c-='a'-10;
      else if (c >= 'A' && c <= 'F') c-='A'-10;
      else break;
      v<<=4;
      v+=c;
    }
  }
  else if (*s == '0' && s[1] <= '7' && s[1] >= '0')
  {
    s++;
    for (;;)
    {
      int c=*s++;
      if (c >= '0' && c <= '7') c-='0';
      else break;
      v<<=3;
      v+=c;
    }
  }
  else
  {
    int sign=0;
    if (*s == '-') { s++; sign++; }
    for (;;)
    {
      int c=*s++ - '0';
      if (c < 0 || c > 9) break;
      v*=10;
      v+=c;
    }
    if (sign) return -(int) v;
  }
  return (int)v;
}