;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: Ukrainian (1058)
;By Yuri Holubow, Our Soft (http://www.ns.lviv.ua)

;--------------------------------
!verbose 3

!ifndef MUI_UKRAINIAN_USED

!define MUI_UKRAINIAN_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\Ukrainian.nlf"

  !define MUI_UKRAINIAN_LANGNAME "Ukrainian" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_UKRAINIAN} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_UKRAINIAN} "������i�� PageDown ��� ����������� ������� �����."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_UKRAINIAN} "�i����i��� �����"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_UKRAINIAN} "����������� ����� ����� ����� i�������i�� ${MUI_PRODUCT}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_UKRAINIAN} "���� �� �������� ��i ����� �����, ������i�� �� ������ ������. �� ������i �������� ����� ����� ��� i�������i� ${MUI_PRODUCT}."
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_UKRAINIAN} "�i��i���� �i ����������, ��i �� ������ ����������, i ��i�i�� �i��i��� ��� ���, ��i �� ������������� �� ������. ������i�� ���i ��� �����������."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_UKRAINIAN} "�����i�� ����������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_UKRAINIAN} "�����i�� ��i ��������i ${MUI_PRODUCT} �� ������ ����������."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_UKRAINIAN} "����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_UKRAINIAN} "�i����i�� ���� ����� �� ����������, ��� �������� ���� ����."
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_UKRAINIAN} "I��������� ���������� ${MUI_PRODUCT} � ��������� �������.$\r$\n$\r$\n��� ���������� � ��� �������, ������i�� ����������. ��� ���������� � i���� ������� ������i�� ������� i �����i�� i���� �������."
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_UKRAINIAN} "�����i�� �i��� ���������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_UKRAINIAN} "�����i�� ������� ��� ��������� ${MUI_PRODUCT}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_UKRAINIAN} "������� �����������"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_UKRAINIAN} "��� ���������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_UKRAINIAN} "����-����� ���������, ���� ��� ��������� ${MUI_PRODUCT}."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_UKRAINIAN} "���������"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_UKRAINIAN} "��������� ���i��� ���������."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_UKRAINIAN} "�� ��������i �� ������ �������� ��������� ${MUI_PRODUCT}?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_UKRAINIAN} "${MUI_VERSION} ���������"
  !endif
  

  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_UKRAINIAN} "�� �������� �������� ${MUI_PRODUCT} � ������ ����'�����."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_UKRAINIAN} "��������� ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_UKRAINIAN} "��������� ${MUI_PRODUCT} � ������ ����'�����."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_UKRAINIAN} "���������"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_UKRAINIAN} "����-����� ��������� ���� ��������� ��������� ${MUI_PRODUCT}."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_UKRAINIAN} "���������"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_UKRAINIAN} "��������� ���i��� ���������."
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_UKRAINIAN} "${MUI_VERSION} ���������"
  !endif
    
!endif

!verbose 4