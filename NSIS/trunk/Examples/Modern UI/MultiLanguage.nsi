;NSIS Modern UI version 1.3
;MultiLanguage & LangDLL Example Script
;Written by Joost Verburg

!define NAME "Test Software" ;Define your own software name here
!define VERSION "1.0" ;Define your own software version here

!verbose 3
  !include "${NSISDIR}\Contrib\Modern UI\System.nsh"
!verbose 4

;--------------------------------
;Configuration

  !define MUI_LICENSEPAGE
  !define MUI_COMPONENTPAGE
  !define MUI_DIRSELECTPAGE
  !define MUI_ABORTWARNING
  !define MUI_UNINSTALLER

  ;Languages
    ;English
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\English.nsh"
       
    ;French
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\French.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\French.nsh"
    
    ;German
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\German.nsh"
    
    ;Spanish
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\Spanish.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\Spanish.nsh"
    
    ;Dutch
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\Dutch.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\Dutch.nsh"
    
    ;Polish
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\Polish.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\Polish.nsh"
    
    ;Greek
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\Greek.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\Greek.nsh"

    ;Russian
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\Russian.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\Russian.nsh"
    
    ;Portuguese (Brasil)
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\PortugueseBR.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\PortugueseBR.nsh"
    
    ;Simplified Chinese
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\SimpChinese.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\SimpChinese.nsh"

    ;Traditional Chinese
    LoadLanguageFile "${NSISDIR}\Contrib\Language files\TradChinese.nlf"
    !include "${NSISDIR}\Contrib\Modern UI\Language files\TradChinese.nsh"    

  ;General
  Name /LANG=${LANG_ENGLISH} "${NAME} ${VERSION}"
  Name /LANG=${LANG_FRENCH} "${NAME} ${VERSION}"
  Name /LANG=${LANG_GERMAN} "${NAME} ${VERSION}"
  Name /LANG=${LANG_SPANISH} "${NAME} ${VERSION}"
  Name /LANG=${LANG_DUTCH} "${NAME} ${VERSION}"
  Name /LANG=${LANG_POLISH} "${NAME} ${VERSION}"
  Name /LANG=${LANG_GREEK} "${NAME} ${VERSION}"
  Name /LANG=${LANG_RUSSIAN} "${NAME} ${VERSION}"
  Name /LANG=${LANG_PORTUGUESEBR} "${NAME} ${VERSION}"
  Name /LANG=${LANG_SIMPCHINESE} "${NAME} ${VERSION}"
  Name /LANG=${LANG_TRADCHINESE} "${NAME} ${VERSION}"
  OutFile "MultiLanguage.exe"

  ;User interface - icons, ui file, check bitmap, progress bar etc.
  !insertmacro MUI_INTERFACE "modern.exe" "modern-install.ico" "modern-uninstall.ico" "modern.bmp" "smooth" "Tahoma" "$9" ;$9 is the variable used to store the current page, do not use this var!

  ;License dialog
  LicenseData /LANG=${LANG_ENGLISH} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_FRENCH} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_GERMAN} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_SPANISH} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_DUTCH} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_POLISH} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_GREEK} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_RUSSIAN} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_PORTUGUESEBR} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_SIMPCHINESE} "${NSISDIR}\Contrib\Modern UI\License.txt"
  LicenseData /LANG=${LANG_TRADCHINESE} "${NSISDIR}\Contrib\Modern UI\License.txt"

  ;Component-select dialog
    ;Titles
    LangString TITLE_SecCopyUI ${LANG_ENGLISH} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_FRENCH} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_GERMAN} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_SPANISH} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_DUTCH} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_POLISH} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_GREEK} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_RUSSIAN} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_PORTUGUESEBR} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_SIMPCHINESE} "modern.exe"
    LangString TITLE_SecCopyUI ${LANG_TRADCHINESE} "modern.exe"
    
    ;Descriptions
    LangString DESC_SecCopyUI ${LANG_ENGLISH} "modern.exe: English description"
    LangString DESC_SecCopyUI ${LANG_FRENCH} "modern.exe: French description"
    LangString DESC_SecCopyUI ${LANG_GERMAN} "modern.exe: German description"
    LangString DESC_SecCopyUI ${LANG_SPANISH} "modern.exe: Spanish description"
    LangString DESC_SecCopyUI ${LANG_DUTCH} "modern.exe: Dutch description"
    LangString DESC_SecCopyUI ${LANG_POLISH} "modern.exe: Polish description"
    LangString DESC_SecCopyUI ${LANG_GREEK} "modern.exe: Greek description"
    LangString DESC_SecCopyUI ${LANG_RUSSIAN} "modern.exe: Greek description"
    LangString DESC_SecCopyUI ${LANG_PORTUGUESEBR} "modern.exe: Portuguese (Brasil) description"
    LangString DESC_SecCopyUI ${LANG_SIMPCHINESE} "modern.exe: Simplified Chinese description"
    LangString DESC_SecCopyUI ${LANG_TRADCHINESE} "modern.exe: Traditional Chinese description"
    
  ;Folder-select dialog
  InstallDir "$PROGRAMFILES\${NAME}"
  
;--------------------------------
;Installer Sections

Section $(TITLE_SecCopyUI) SecCopyUI

  ;ADD YOUR OWN STUFF HERE!

  SetOutPath "$INSTDIR"
  File "${NSISDIR}\Contrib\UIs\modern.exe"
  
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

Section ""

  ;Invisible section to display the Finish header & write the language to the registry
  
  WriteRegStr HKCU "Software\${NAME}" "Installer Language" $LANGUAGE
  !insertmacro MUI_FINISHHEADER SetPage

SectionEnd

;--------------------------------
;Installer Functions

Function .onInit

  ;Language selection

  Push Tahoma
  Push 8

  Push ${LANG_ENGLISH}
  Push "${MUI_ENGLISH_LANGNAME}"
  Push ${LANG_FRENCH}
  Push "${MUI_FRENCH_LANGNAME}"
  Push ${LANG_GERMAN}
  Push "${MUI_GERMAN_LANGNAME}"
  Push ${LANG_SPANISH}
  Push "${MUI_SPANISH_LANGNAME}"
  Push ${LANG_DUTCH}
  Push "${MUI_DUTCH_LANGNAME}"
  Push ${LANG_POLISH}
  Push "${MUI_POLISH_LANGNAME}"
  Push ${LANG_GREEK}
  Push "${MUI_GREEK_LANGNAME}"
  Push ${LANG_RUSSIAN}
  Push "${MUI_RUSSIAN_LANGNAME}"
  Push ${LANG_PORTUGUESEBR}
  Push "${MUI_PORTUGUESEBR_LANGNAME}"
  Push ${LANG_TRADCHINESE}
  Push "${MUI_TRADCHINESE_LANGNAME}"
  Push ${LANG_SIMPCHINESE}
  Push "${MUI_SIMPCHINESE_LANGNAME}"
  
  Push 11F ;11 = number of languages, F = change font

  LangDLL::LangDialog "Installer Language" "Please select a language."

  Pop $LANGUAGE
  StrCmp $LANGUAGE "cancel" 0 +2
    Abort

FunctionEnd

!insertmacro MUI_BASICFUNCTIONS

!insertmacro MUI_FUNCTION_DESCRIPTION_START
  !insertmacro MUI_DESCRIPTION_TEXT ${SecCopyUI} $(DESC_SecCopyUI)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
 
!insertmacro MUI_FUNCTION_ABORTWARNING

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN STUFF HERE!

  Delete "$INSTDIR\modern.exe"
  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"
  
  DeleteRegValue HKCU "Software\${NAME}" "Installer Language"

  ;Display the Finish header
  !insertmacro MUI_FINISHHEADER un.SetPage

SectionEnd

;--------------------------------
;Uninstaller Functions

Function un.onInit
  ReadRegStr $LANGUAGE HKCU "Software\${NAME}" "Installer Language"
FunctionEnd

!insertmacro MUI_UNBASICFUNCTIONS