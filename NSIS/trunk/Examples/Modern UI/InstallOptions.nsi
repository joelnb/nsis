;NSIS Modern Style UI version 1.19
;InstallOptions Example Script
;Written by Joost Verburg

!define NAME "Test Software" ;Define your own software name here
!define VERSION "1.0" ;Define your own software version here

!verbose 3
!include "${NSISDIR}\Examples\WinMessages.nsh"
!include "ModernUI.nsh"
!verbose 4

!define IO_NOSETDIRECTION $7
!define IO_DIRECTION $8
!define CURRENTPAGE $9

!define TEMP1 $R0
!define TEMP2 $R1

;--------------------------------

  ;General
  Name "${NAME} ${VERSION}"
  OutFile "InstallOptions.exe"
  SetOverwrite on

  ;User interface
  !insertmacro MUI_INTERFACE "modern.exe" "adni18-installer-C-no48xp.ico" "adni18-uninstall-C-no48xp.ico" "modern.bmp" "smooth"

  ;License dialog
  LicenseText "Press Page Down to see the rest of the agreement."
  LicenseData "License.txt"

  ;Component-select dialog
  ComponentText "Check the components you want to install and uncheck the components you don't want to install. Click Next to continue."

  ;Folder-select dialog
  InstallDir "$PROGRAMFILES\${NAME}"
  DirText "Setup will install ${NAME} in the following folder.$\r$\n$\r$\nTo install in this folder, click Install. To install in a different folder, click Browse and select another folder." " "
  InstallButtonText "Next >" ;Install Options dialog has 'Install' button

  ;Uninstaller
  UninstallText "This will uninstall ${NAME} from your system."

;--------------------------------
;Installer Sections

Section "Modern.exe" SecCopyUI

  ;Add your stuff here

  SetOutPath "$INSTDIR"
  File "${NSISDIR}\Contrib\UIs\modern.exe"

SectionEnd

Section "Create uninstaller" SecCreateUninst

  ;Add your stuff here

  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

Section ""

  ;Invisible section to display the Finish header
  !insertmacro MUI_FINISHHEADER SetPage

SectionEnd

;--------------------------------
;Installer Functions

Function .onInit

  ;Init InstallOptions
  !insertmacro MUI_INSTALLOPTIONS_INIT ;Call this when using no plugins before using Install Options (init plugin system)
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "iniA.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "iniB.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "iniC.ini"

FunctionEnd

Function .onInitDialog

  !insertmacro MUI_INNERDIALOG_INIT

    !insertmacro MUI_INNERDIALOG_START 1
      !insertmacro MUI_INNERDIALOG_TEXT 1033 1040 "If you accept all the terms of the agreement, choose I Agree to continue. If you choose Cancel, Setup will close. You must accept the agreement to install ${NAME}."
    !insertmacro MUI_INNERDIALOG_STOP 1

    !insertmacro MUI_INNERDIALOG_START 4
      !insertmacro MUI_INNERDIALOG_TEXT 1033 1042 "Description"
      !insertmacro MUI_INNERDIALOG_TEXT 1033 1043 "Hover your mouse over a component to see it's description."
    !insertmacro MUI_INNERDIALOG_STOP 4

    !insertmacro MUI_INNERDIALOG_START 5
      !insertmacro MUI_INNERDIALOG_TEXT 1033 1041 "Destination Folder"
      !insertmacro MUI_INNERDIALOG_STOP 5

  !insertmacro MUI_INNERDIALOG_END

FunctionEnd

Function .onNextPage

  !insertmacro MUI_NEXTPAGE_OUTER
  !insertmacro MUI_INSTALLOPTIONS_NEXTPAGE
  !insertmacro MUI_NEXTPAGE SetPage

FunctionEnd

Function .onPrevPage

  !insertmacro MUI_INSTALLOPTIONS_PREVPAGE
  !insertmacro MUI_PREVPAGE SetPage

FunctionEnd

Function SetPage

  !insertmacro MUI_PAGE_INIT

    !insertmacro MUI_PAGE_START 1
       !insertmacro MUI_HEADER_TEXT 1033 "License Agreement" "Please review the license terms before installing ${NAME}."
    !insertmacro MUI_PAGE_STOP 1

    !insertmacro MUI_PAGE_START 2
       !insertmacro MUI_HEADER_TEXT 1033 "Install Options A" "Create your own dialog!"
       WriteIniStr "$PLUGINSDIR\iniA.ini" "Settings" "Title" "${NAME} ${VERSION} Setup: Install Options A"
       WriteIniStr "$PLUGINSDIR\iniA.ini" "Settings" "CancelConfirm" "Are you sure you want to quit ${NAME} Setup?"
       WriteIniStr "$PLUGINSDIR\iniA.ini" "Settings" "CancelConfirmCaption" "${NAME} ${VERSION} Setup"
       WriteIniStr "$PLUGINSDIR\iniA.ini" "Settings" "CancelConfirmIcon" "MB_ICONWARNING"
       !insertmacro MUI_INSTALLOPTIONS_SHOW 2 "iniA.ini" "" "IO" ;Next page is an IO page
    !insertmacro MUI_PAGE_STOP 2

    !insertmacro MUI_PAGE_START 3
       !insertmacro MUI_HEADER_TEXT 1033 "Install Options B" "Create your own dialog!"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "Title" "${NAME} ${VERSION} Setup: Install Options B"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "CancelConfirm" "Are you sure you want to quit ${NAME} Setup?"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "CancelConfirmCaption" "${NAME} ${VERSION} Setup"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "CancelConfirmIcon" "MB_ICONWARNING"
       !insertmacro MUI_INSTALLOPTIONS_SHOW 3 "iniB.ini" "IO" "" ;Previous page is an IO page
    !insertmacro MUI_PAGE_STOP 3

    !insertmacro MUI_PAGE_START 4
      !insertmacro MUI_HEADER_TEXT 1033 "Choose Components" "Choose the components you want to install."
    !insertmacro MUI_PAGE_STOP 4

    !insertmacro MUI_PAGE_START 5
      !insertmacro MUI_HEADER_TEXT 1033 "Choose Install Location" "Choose the folder in which to install ${NAME}."
    !insertmacro MUI_PAGE_STOP 5

    !insertmacro MUI_PAGE_START 6
       !insertmacro MUI_HEADER_TEXT 1033 "Install Options C" "Create your own dialog!"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "Title" "${NAME} ${VERSION} Setup: Install Options C"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "CancelConfirm" "Are you sure you want to quit ${NAME} Setup?"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "CancelConfirmCaption" "${NAME} ${VERSION} Setup"
       WriteIniStr "$PLUGINSDIR\iniB.ini" "Settings" "CancelConfirmIcon" "MB_ICONWARNING"
       !insertmacro MUI_INSTALLOPTIONS_SHOW 6 "iniC.ini" "" ""
    !insertmacro MUI_PAGE_STOP 6

    !insertmacro MUI_PAGE_START 7
      !insertmacro MUI_HEADER_TEXT 1033 "Installing" "Please wait while ${NAME} is being installed."
    !insertmacro MUI_PAGE_STOP 7

    !insertmacro MUI_PAGE_START 8
      !insertmacro MUI_HEADER_TEXT 1033 "Finished" "Setup was completed successfully."
    !insertmacro MUI_PAGE_STOP 8

  !insertmacro MUI_PAGE_END

FunctionEnd

Function .onMouseOverSection

  !insertmacro MUI_DESCRIPTION_INIT

    !insertmacro MUI_DESCRIPTION_TEXT 1033 ${SecCopyUI} "Copy the modern.exe file to the application folder."
    !insertmacro MUI_DESCRIPTION_TEXT 1033 ${SecCreateUninst} "Create a uninstaller which can automatically delete ${NAME}."

 !insertmacro MUI_DESCRIPTION_END

FunctionEnd

Function .onUserAbort

  !insertmacro MUI_ABORTWARNING 1033 "Are you sure you want to quit ${NAME} Setup?"
  !insertmacro MUI_ABORTWARNING_END

FunctionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;Add your stuff here

  Delete "$INSTDIR\modern.exe"
  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  !insertmacro MUI_FINISHHEADER un.SetPage

SectionEnd

;--------------------------------
;Uninstaller Functions

Function un.onNextPage

  !insertmacro MUI_NEXTPAGE_OUTER
  !insertmacro MUI_NEXTPAGE un.SetPage

FunctionEnd

Function un.SetPage

  !insertmacro MUI_PAGE_INIT

    !insertmacro MUI_PAGE_START 1
      !insertmacro MUI_HEADER_TEXT 1033 "Uninstall ${NAME}" "Remove ${NAME} from your system."
    !insertmacro MUI_PAGE_STOP 1

    !insertmacro MUI_PAGE_START 2
      !insertmacro MUI_HEADER_TEXT 1033 "Uninstalling" "Please wait while ${NAME} is being uninstalled."
    !insertmacro MUI_PAGE_STOP 2

    !insertmacro MUI_PAGE_START 3
      !insertmacro MUI_HEADER_TEXT 1033 "Finished" "${NAME} has been removed from your system."
    !insertmacro MUI_PAGE_STOP 3

  !insertmacro MUI_PAGE_END

FunctionEnd

;eof
