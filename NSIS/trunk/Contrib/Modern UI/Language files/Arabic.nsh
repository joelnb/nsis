;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: Arabic (1025)
;By asdfuae@msn.com

;--------------------------------
!verbose 3

!ifndef MUI_ARABIC_USED

!define MUI_ARABIC_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\Arabic.nlf"

  !define MUI_ARABIC_LANGNAME "Arabic" ;���� (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_ARABIC} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_ARABIC} "���� ���� ������ ����� �������� �������"
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_ARABIC} "�������� �������"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_ARABIC} "������ ������ �������� ������� ��� ����� ${MUI_PRODUCT}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_ARABIC} "���� ����� ������ ������� �� ����� ��� ���� �������� ������ա �� ������ ������� ���� �������� ��� �������� ����� ${MUI_PRODUCT}."
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_ARABIC} "���� ������� ������ ������� � ��� ������� ����� �����ɡ �� ���� ������ ������ �������"
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_ARABIC} "���� ������� �������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_ARABIC} "���� ����� ������ ������� �� ${MUI_PRODUCT}."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_ARABIC} "�����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_ARABIC} "��� ����� ��� ��� ������� ������ ����� �� ����"
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_ARABIC} "���� ����� �������� ${MUI_PRODUCT} �� ������ ������$\r$\n$\r$\n���� ����� ������� �� ��� ������. ������� �� ���� ��ѡ ���� ���� � ���� ������ �����."
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_ARABIC} "���� ���� �������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_ARABIC} "���� ������ ������ ����� ��� �������� ${MUI_PRODUCT}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_ARABIC} "������ ������"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_ARABIC} "��������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_ARABIC} "������ �������� ���� ����� ${MUI_PRODUCT}."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_ARABIC} "�������� �� �����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_ARABIC} "�������� �� ����� ����� ��������"
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_ARABIC} "�� ��� ����� �� ����� ���� ${MUI_PRODUCT}�"
  !endif

  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_ARABIC} "����� ${MUI_PRODUCT} ${MUI_VERSION}"
  !endif
  

  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_ARABIC} "��� ����� �� ����� �������� ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_ARABIC} "���� ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_ARABIC} "����� ${MUI_PRODUCT} �� �����"
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_ARABIC} "�����"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_ARABIC} "������ �������� ���� ����� ${MUI_PRODUCT}."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_ARABIC} "���"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_ARABIC} "��� ������� ����� � ��������"
  !endif

  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_ARABIC} "����� ${MUI_PRODUCT} ${MUI_VERSION}"
  !endif

!endif

!verbose 4