/*
 * main.c: executable header main code
 * 
 * This file is a part of NSIS.
 * 
 * Copyright (C) 1999-2017 Nullsoft and Contributors
 * 
 * Licensed under the zlib/libpng license (the "License");
 * you may not use this file except in compliance with the License.
 * 
 * Licence details can be found in the file COPYING.
 * 
 * This software is provided 'as-is', without any express or implied
 * warranty.
 */

#include "../Platform.h"
#include <shlobj.h>
#include <shellapi.h>
#include "resource.h"
#include "util.h"
#include "fileform.h"
#include "state.h"
#include "ui.h"
#include "lang.h"
#include "state.h"
#include "exec.h"
#include "plugin.h"

#ifndef LOAD_LIBRARY_SEARCH_USER_DIRS
#define LOAD_LIBRARY_SEARCH_USER_DIRS 0x00000400
#define LOAD_LIBRARY_SEARCH_SYSTEM32 0x00000800
#endif
#ifndef SHTDN_REASON_FLAG_PLANNED
#define SHTDN_REASON_FLAG_PLANNED 0x80000000
#endif
#ifndef SHTDN_REASON_MAJOR_APPLICATION
#define SHTDN_REASON_MAJOR_APPLICATION 0x00040000
#endif
#ifndef SHTDN_REASON_MINOR_INSTALLATION
#define SHTDN_REASON_MINOR_INSTALLATION 0x0002
#endif
#ifndef SHUTDOWN_RESTART
#define SHUTDOWN_RESTART 0x00000004
#endif
#ifndef SHUTDOWN_FORCE_OTHERS
#define SHUTDOWN_FORCE_OTHERS 0x00000001
#endif
#ifndef SHUTDOWN_GRACE_OVERRIDE
#define SHUTDOWN_GRACE_OVERRIDE 0x00000020
#endif

#if !defined(NSIS_CONFIG_VISIBLE_SUPPORT) && !defined(NSIS_CONFIG_SILENT_SUPPORT)
#error One of NSIS_CONFIG_SILENT_SUPPORT or NSIS_CONFIG_VISIBLE_SUPPORT must be defined.
#endif
#ifdef NSIS_COMPRESS_WHOLE
extern HANDLE dbd_hFile;
#endif

char g_caption[NSIS_MAX_STRLEN*2];
#ifdef NSIS_CONFIG_VISIBLE_SUPPORT
HWND g_hwnd;
HANDLE g_hInstance;
#endif

void NSISCALL CleanUp();

char *ValidateTempDir()
{
  validate_filename(state_temp_dir);
  if (!validpathspec(state_temp_dir))
    return NULL;
  addtrailingslash(state_temp_dir);
  CreateNormalDirectory(state_temp_dir);
  // state_language is used as a temp var here
  return my_GetTempFileName(state_language, state_temp_dir);
}

void *g_SHGetFolderPath;

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, LPSTR lpszCmdParam, int nCmdShow)
{
  int ret = 0;
  const char *m_Err = _LANG_ERRORWRITINGTEMP;

  int cl_flags = 0;

  char *realcmds;
  char seekchar=' ';
  char *cmdline;

  SetErrorMode(SEM_NOOPENFILEERRORBOX | SEM_FAILCRITICALERRORS);

  {
    // bug #1125: Don't load modules from the application nor current directory.
    // SetDefaultDllDirectories() allows us to restrict implicitly loaded and 
    // dynamically loaded modules to just %windir%\System32 and directories 
    // added with AddDllDirectory(). This prevents DLL search order attacks (CAPEC-471).
    DWORD winver = GetVersion();
    // CoCreateInstance(CLSID_ShellLink, ...) fails on Vista if SetDefaultDllDirectories is called
    BOOL avoidwinbug = LOWORD(winver) == MAKEWORD(6, 0);
    if (!avoidwinbug)
    {
      FARPROC fp = myGetProcAddress(MGA_SetDefaultDllDirectories);
      if (fp) ((BOOL(WINAPI*)(DWORD))fp)(LOAD_LIBRARY_SEARCH_SYSTEM32|LOAD_LIBRARY_SEARCH_USER_DIRS);
    }
    // SetDefaultDllDirectories might not be available so we try to preload various libraries as 
    // best we can before Windows gets a chance to mess things up by loading from the wrong directory.
    {
      static const char preload[] = 
        "UXTHEME\0" // Vista: OleInitialize calls NtUserCreateWindowEx and that pulls in UXTheme.dll
        "USERENV\0" // Vista: SHGetFileInfo ends up in SHELL32.kfapi::GetUserProfileDir and that pulls in UserEnv.dll
        "SETUPAPI\0" // XP: SHGetFileInfo ends up in CMountPoint::_InitLocalDriveHelper and that pulls in SetupAPI.dll
        "APPHELP\0" // Vista: SHGetFileInfo ... SHELL32.SHILAliasTranslate ... SHELL32.ApphelpCheckShellObject
        "PROPSYS\0" // Vista: SHGetFileInfo ... SHELL32.SHILAliasTranslate ... SHLWAPI.#187 ... SHLWAPI.#505/SHPropertyBag_ReadGUID
        "DWMAPI\0" // Win7 without KB2533623: UXTheme pulls in DWMAPI.dll
        "CRYPTBASE\0" // Win7 without KB2533623: OleInitialize ... RPCRT4.UuidCreate ... RPCRT4.GenerateRandomNumber
        "OLEACC\0" // Vista: SHFileOperation ... SHELL32.CProgressDialogUI::_Setup ... SHELL32.GetRoleTextW
        "CLBCATQ\0" // XP.SP2&SP3: SHAutoComplete ... OLE32!InitializeCatalogIfNecessary ... OLE32!CComCatalog::TryToLoadCLB
#ifndef NSIS_SUPPORT_GETDLLVERSION
        "VERSION\0"
#endif
      ;
      const char *dll;
      for (dll = preload; dll[0]; dll += lstrlenA(dll) + 1)
        LoadSystemLibrary(dll);
    }
  }

  // Because myGetProcAddress now loads dlls with a full path 
  // under GetSystemDirectory() the previous issues in <= v3.0b2 with 
  // 'SetOutPath' and/or 'File "shfolder.dll"' no longer apply.
  // All MGA dlls still need to be loaded early here because installers 
  // running under WoW64 might disable WoW64 FS redirection in .onInit and 
  // because GetSystemDirectory() can return the native system32 path we need
  // the redirection to be turned off so LoadLibrary uses the correct folder.
  // Note: We also import directly from KERNEL32, ADVAPI32 and SHELL32 so they 
  // are exempt from this requirement and SHELL32 imports from SHLWAPI on 
  // WoW64 systems and it is also on the KnownDLLs list so 
  // SHLWAPI also gets a pass and that just leaves 
#ifdef NSIS_SUPPORT_GETDLLVERSION
  myGetProcAddress(MGA_GetFileVersionInfo); // VERSION
#endif
  g_SHGetFolderPath = myGetProcAddress(MGA_SHGetFolderPathA); // and SHFOLDER


  InitCommonControls();

#if defined(NSIS_SUPPORT_ACTIVEXREG) || defined(NSIS_SUPPORT_CREATESHORTCUT)
  {
    extern HRESULT g_hres;
    g_hres=OleInitialize(NULL);
  }
#endif


  {
    // workaround for bug #1008632
    // http://sourceforge.net/tracker/index.php?func=detail&aid=1008632&group_id=22049&atid=373085
    //
    // without this, SHGetSpecialFolderLocation doesn't always recognize
    // some special folders, like the desktop folder for all users, on
    // Windows 9x. unlike SHGetSpecialFolderPath, which is not available
    // on all versions of Windows, SHGetSpecialFolderLocation doesn't try
    // too hard to make sure the caller gets what he asked for. so we give
    // it a little push in the right direction by doing part of the work
    // for it.
    //
    // part of what SHGetFileInfo does, is to convert a path into an idl.
    // to do this conversion, it first needs to initialize the list of 
    // special idls, which are exactly the idls we use to get the paths
    // of special folders (CSIDL_*).

    SHFILEINFO shfi;
    SHGetFileInfo("", 0, &shfi, sizeof(SHFILEINFO), 0);
  }

  mystrcpy(g_caption,_LANG_GENERIC_ERROR);

  mystrcpy(state_command_line, GetCommandLine());

#ifdef NSIS_CONFIG_VISIBLE_SUPPORT
  g_hInstance = GetModuleHandle(NULL);
#endif//NSIS_CONFIG_VISIBLE_SUPPORT

  cmdline = state_command_line;
  if (*cmdline == '\"') seekchar = *cmdline++;

  cmdline=findchar(cmdline, seekchar);
  cmdline=CharNext(cmdline);
  realcmds=cmdline;

  while (*cmdline)
  {
    // skip over any spaces
    while (*cmdline == ' ') cmdline++;
    
    // get char we should look for to get the next parm
    seekchar = ' ';
    if (cmdline[0] == '\"')
    {
      cmdline++;
      seekchar = '\"';
    }

    // is it a switch?
    if (cmdline[0] == '/')
    {
      cmdline++;

// this only works with spaces because they have just one bit on
#define END_OF_ARG(c) (((c)|' ')==' ')

#if defined(NSIS_CONFIG_VISIBLE_SUPPORT) && defined(NSIS_CONFIG_SILENT_SUPPORT)
      if (cmdline[0] == 'S' && END_OF_ARG(cmdline[1]))
        cl_flags |= FH_FLAGS_SILENT;
#endif//NSIS_CONFIG_SILENT_SUPPORT && NSIS_CONFIG_VISIBLE_SUPPORT
#ifdef NSIS_CONFIG_CRC_SUPPORT
      if (*(LPDWORD)cmdline == CHAR4_TO_DWORD('N','C','R','C') && END_OF_ARG(cmdline[4]))
        cl_flags |= FH_FLAGS_NO_CRC;
#endif//NSIS_CONFIG_CRC_SUPPORT

      if (*(LPDWORD)(cmdline-2) == CHAR4_TO_DWORD(' ', '/', 'D','='))
      {
        *(LPDWORD)(cmdline-2)=0; // keep this from being passed to uninstaller if necessary
        mystrcpy(state_install_directory,cmdline+2);
        break; // /D= must always be last
      }
    }

    // skip over our parm
    cmdline = findchar(cmdline, seekchar);
    // skip the quote
    if (*cmdline == '\"')
      cmdline++;
  }

  GetTempPath(NSIS_MAX_STRLEN, state_temp_dir);
  if (!ValidateTempDir())
  {
    GetWindowsDirectory(state_temp_dir, NSIS_MAX_STRLEN - 5); // leave space for \Temp
    mystrcat(state_temp_dir, "\\Temp");
    if (!ValidateTempDir())
    {
      goto end;
    }
  }
  DeleteFile(state_language);

  m_Err = loadHeaders(cl_flags);
  if (m_Err) goto end;

#ifdef NSIS_CONFIG_UNINSTALL_SUPPORT
  if (g_is_uninstaller)
  {
    char *p = findchar(state_command_line, 0);

    // state_command_line has state_install_directory right after it in memory, so reading
    // a bit over state_command_line won't do any harm
    while (p >= state_command_line && *(LPDWORD)p != CHAR4_TO_DWORD(' ', '_', '?', '=')) p--;

    m_Err = _LANG_UNINSTINITERROR;

    if (p >= state_command_line)
    {
      *p=0; // terminate before "_?="
      p+=4; // skip over " _?="
      if (is_valid_instpath(p))
      {
        mystrcpy(state_install_directory, p);
        mystrcpy(state_output_directory, p);
        m_Err = 0;
      }
      else
      {
        goto end;
      }
    }
    else
    {
      int x, admin = UserIsAdminGrpMember();

      mystrcat(state_temp_dir,TEXT("~nsu"));
      if (admin) mystrcat(state_temp_dir,TEXT("A")); // Don't lock down the directory used by non-admins
      mystrcat(state_temp_dir,TEXT(".tmp"));

      // check if already running from uninstaller temp dir
      // this prevents recursive uninstaller calls
      if (!lstrcmpi(state_temp_dir,state_exe_directory))
        goto end;

      admin ? CreateRestrictedDirectory(state_temp_dir) : CreateNormalDirectory(state_temp_dir);
      SetCurrentDirectory(state_temp_dir);

      if (!state_install_directory[0])
        mystrcpy(state_install_directory,state_exe_directory);

      mystrcpy(g_usrvars[0], realcmds);
      *(LPWORD)g_usrvars[1] = CHAR2_TO_WORD('A',0);

      for (x = 0; x < 26; x ++)
      {
        static char buf2[NSIS_MAX_STRLEN];

        GetNSISString(buf2,g_header->str_uninstchild); // $TEMP\$1u_.exe

        DeleteFile(buf2); // clean up after all the other ones if they are there

        if (m_Err) // not done yet
        {
          // copy file
          if (CopyFile(state_exe_path,buf2,TRUE))
          {
            HANDLE hProc;
#ifdef NSIS_SUPPORT_MOVEONREBOOT
            MoveFileOnReboot(buf2,NULL);
#endif
            GetNSISString(buf2,g_header->str_uninstcmd); // '"$TEMP\$1u_.exe" $0 _?=$INSTDIR\'
            hProc=myCreateProcess(buf2);
            if (hProc)
            {
              CloseHandle(hProc);
              // success
              m_Err = 0;
            }
          }
        }
        g_usrvars[1][0]++;
      }

#ifdef NSIS_SUPPORT_MOVEONREBOOT
      MoveFileOnReboot(state_temp_dir,NULL);
#endif

      goto end;
    }
  }
#endif//NSIS_CONFIG_UNINSTALL_SUPPORT

  g_exec_flags.errlvl = -1;
  ret = ui_doinstall();

#ifdef NSIS_CONFIG_LOG
#if !defined(NSIS_CONFIG_LOG_ODS) && !defined(NSIS_CONFIG_LOG_STDOUT)
  log_write(1);
#endif//!NSIS_CONFIG_LOG_ODS && !NSIS_CONFIG_LOG_STDOUT
#endif//NSIS_CONFIG_LOG
end:

  CleanUp();

#if defined(NSIS_SUPPORT_ACTIVEXREG) || defined(NSIS_SUPPORT_CREATESHORTCUT)
  OleUninitialize();
#endif

  if (m_Err)
  {
    my_MessageBox(m_Err, MB_OK | MB_ICONSTOP | (IDOK << 21));
    ExitProcess(2);
    return 0;
  }

#ifdef NSIS_SUPPORT_REBOOT
  if (g_exec_flags.reboot_called)
  {
    const DWORD reason = SHTDN_REASON_FLAG_PLANNED | SHTDN_REASON_MAJOR_APPLICATION | SHTDN_REASON_MINOR_INSTALLATION;
    BOOL (WINAPI *OPT)(HANDLE, DWORD,PHANDLE);
    BOOL (WINAPI *LPV)(LPCTSTR,LPCTSTR,PLUID);
    BOOL (WINAPI *ATP)(HANDLE,BOOL,PTOKEN_PRIVILEGES,DWORD,PTOKEN_PRIVILEGES,PDWORD);
    BOOL (WINAPI *IS)(LPTSTR,LPTSTR,DWORD,DWORD,DWORD);
    OPT=myGetProcAddress(MGA_OpenProcessToken);
    LPV=myGetProcAddress(MGA_LookupPrivilegeValueA);
    ATP=myGetProcAddress(MGA_AdjustTokenPrivileges);
    if (OPT && LPV && ATP)
    {
      HANDLE hToken;
      TOKEN_PRIVILEGES tkp;
      if (OPT(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken))
      {
        LPV(NULL, SE_SHUTDOWN_NAME, &tkp.Privileges[0].Luid);
        tkp.PrivilegeCount = 1;
        tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
        ATP(hToken, FALSE, &tkp, 0, (PTOKEN_PRIVILEGES)NULL, 0);
      }
    }

    IS=myGetProcAddress(MGA_InitiateShutdown);
    if ( (IS && !IS(NULL, NULL, 0, SHUTDOWN_RESTART | SHUTDOWN_FORCE_OTHERS | SHUTDOWN_GRACE_OVERRIDE, reason))
      || (!ExitWindowsEx(EWX_REBOOT, reason))
      )
      ExecuteCallbackFunction(CB_ONREBOOTFAILED);
  }
#endif//NSIS_SUPPORT_REBOOT

  if (g_exec_flags.errlvl != -1)
    ret = g_exec_flags.errlvl;

  ExitProcess(ret);
  return 0;
}

void NSISCALL CleanUp()
{
  if (g_db_hFile != INVALID_HANDLE_VALUE)
  {
    CloseHandle(g_db_hFile);
    g_db_hFile = INVALID_HANDLE_VALUE;
  }
#ifdef NSIS_COMPRESS_WHOLE
  if (dbd_hFile != INVALID_HANDLE_VALUE)
  {
    CloseHandle(dbd_hFile);
    dbd_hFile = INVALID_HANDLE_VALUE;
  }
#endif
  // Notify plugins that we are about to unload
  Plugins_UnloadAll();
#ifdef NSIS_CONFIG_PLUGIN_SUPPORT
  // Clean up after plug-ins
  myDelete(state_plugins_dir, DEL_DIR | DEL_RECURSE | DEL_REBOOT);
#endif // NSIS_CONFIG_PLUGIN_SUPPORT
}
