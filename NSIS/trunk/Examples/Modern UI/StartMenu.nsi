;NSIS Modern User Interface version 1.5
;Start Menu Folder Selection Example Script
;Written by Joost Verburg

!define MUI_PRODUCT "Test Software" ;Define your own software name here
!define MUI_VERSION "1.0" ;Define your own software version here

!include "${NSISDIR}\Contrib\Modern UI\System.nsh"

;$9 is being used to store the Start Menu Folder.
;Do not use this variable in your script!

;You can change this variable or the default Start Menu Folder by using
;these defines:
;!define MUI_STARTMENU_VARIABLE "$VARNAME"
;!define MUI_STARTMENU_DEFAULTFOLDER "Folder Name"

;--------------------------------
;Configuration

  !define MUI_LICENSEPAGE
  !define MUI_COMPONENTSPAGE
  !define MUI_DIRECTORYPAGE
  !define MUI_ABORTWARNING
  !define MUI_UNINSTALLER
  
  !define MUI_STARTMENUPAGE
  
  !define TEMP1 $R0

  ;Language
  !insertmacro MUI_LANGUAGE "English"
  
  ;General
  OutFile "StartMenu.exe"

  ;License page
  LicenseData "${NSISDIR}\Contrib\Modern UI\License.txt"

  ;Descriptions
  LangString DESC_SecCopyUI ${LANG_ENGLISH} "Copy the modern.exe file to the application folder."

  ;Folder-selection page
  InstallDir "$PROGRAMFILES\${MUI_PRODUCT}"

;--------------------------------
;Modern UI System

!insertmacro MUI_SYSTEM

;--------------------------------
;Installer Sections

Section "modern.exe" SecCopyUI

  ;ADD YOUR OWN STUFF HERE!

  SetOutPath "$INSTDIR"
  File "${NSISDIR}\Contrib\UIs\modern.exe"
  
  ;Create shortcut
  CreateDirectory "$SMPROGRAMS\${MUI_STARTMENU_VARIABLE}"
  CreateShortCut "$SMPROGRAMS\${MUI_STARTMENU_VARIABLE}\Modern UI.lnk" "$INSTDIR\modern.exe"
  
  ;Write shortcut location to the registry (for Uninstaller)
  WriteRegStr HKCU "Software\${MUI_PRODUCT}" "Start Menu Folder" "${MUI_STARTMENU_VARIABLE}"
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

!insertmacro MUI_SECTIONS_FINISHHEADER ;Insert this macro after the sections

;--------------------------------
;Descriptions

!insertmacro MUI_FUNCTIONS_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecCopyUI} $(DESC_SecCopyUI)
!insertmacro MUI_FUNCTIONS_DESCRIPTION_END
 
;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN STUFF HERE!

  Delete "$INSTDIR\modern.exe"
  Delete "$INSTDIR\Uninstall.exe"
  
  ;Remove shortcut
  ReadRegStr ${TEMP1} HKCU "Software\${MUI_PRODUCT}" "Start Menu Folder"
  Delete "$SMPROGRAMS\${TEMP1}\Modern UI.lnk"
  RMDir "$SMPROGRAMS\${TEMP1}" ;Only if empty, so it won't delete other shortcuts

  RMDir "$INSTDIR"
  
  DeleteRegValue HKCU "Software\${MUI_PRODUCT}" "Start Menu Folder"

  ;Display the Finish header
  !insertmacro MUI_UNFINISHHEADER

SectionEnd