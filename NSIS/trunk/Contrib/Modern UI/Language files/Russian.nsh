;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: Russian (1049)
;By Nik Medved (brainsucker). Fixed by Scam.

;--------------------------------
!verbose 3

!ifndef MUI_RUSSIAN_USED

!define MUI_RUSSIAN_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\Russian.nlf"

  !define MUI_RUSSIAN_LANGNAME "Russian" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_RUSSIAN} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_RUSSIAN} "������� PageDown, ����� ����������� ������������ ����������."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_RUSSIAN} "������������ ����������"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_RUSSIAN} "����������� ������� ���������� ����� ����������� ${MUI_PRODUCT}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_RUSSIAN} "���� �� ���������� ��� ������� ����������, ������� �� ������ ��������. �� ������ ������� ������� ���������� ��� ���������� ${MUI_PRODUCT}."
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_RUSSIAN} "�������� �� ����������, ������� �� ������ ����������, � ������� ������� ��� ���, ������� �� ������������� �� ������. ������� ����� ��� �����������."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_RUSSIAN} "�������� ����������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_RUSSIAN} "�������� ����� ����������� ${MUI_PRODUCT} �� ������ ����������."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_RUSSIAN} "��������"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_RUSSIAN} "��������� ������ ���� � ����������, ����� ������� ��� ��������."
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_RUSSIAN} "���������� ��������� ${MUI_PRODUCT} � �������� �������.$\r$\n$\r$\n����� ���������� � ���� �������, ������� ����������. ����� ���������� � ������ �������, ������� ����� � �������� ������ �������."
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_RUSSIAN} "�������� ����� ���������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_RUSSIAN} "�������� ������� ��� ��������� ${MUI_PRODUCT}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_RUSSIAN} "������� ����������"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_RUSSIAN} "���� ���������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_RUSSIAN} "���������� ���������, ���� ���� ��������� ${MUI_PRODUCT}."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_RUSSIAN} "���������"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_RUSSIAN} "��������� ������� ���������."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_RUSSIAN} "�� �������, ��� ������ �������� ��������� ${MUI_PRODUCT}?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_RUSSIAN} "${MUI_PRODUCT} ${MUI_VERSION} ���������"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_RUSSIAN} "��� ��������� ������ ${MUI_PRODUCT} � ������ ����������."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_RUSSIAN} "�������� ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_RUSSIAN} "�������� ${MUI_PRODUCT} � ������ ����������."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_RUSSIAN} "��������"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_RUSSIAN} "���������� ���������, ���� ��������� ${MUI_PRODUCT}."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_RUSSIAN} "���������"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_RUSSIAN} "�������� ������� ���������."
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_RUSSIAN} "${MUI_PRODUCT} ${MUI_VERSION} ���������"
  !endif
    
!endif

!verbose 4