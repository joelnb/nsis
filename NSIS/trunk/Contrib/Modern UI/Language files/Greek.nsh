;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: Greek (1032)
;By Makidis N. Mike

;--------------------------------
!verbose 3

!ifndef MUI_GREEK_USED

!define MUI_GREEK_USED

  !define MUI_GREEK_LANGNAME "Greek" ;�������� (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
    LicenseText /LANG=${LANG_GREEK} "������� �� Page Down ��� �� ����� �� �������� ��� ������ ������."
    LangString MUI_TEXT_LICENSE_TITLE ${LANG_GREEK} "�������� ������ ������"  
    LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_GREEK} "������� ���� ����� ��� ������ ������ ���� ������������� �� '${NAME}'."
    LangString MUI_INNERTEXT_LICENSE ${LANG_GREEK} "��� �� ���������� � ����������� ������ �� ����������� ����� ���� ����� ��� ������ ������. �� ���� ����������, ����� ���� ��� �������, ������ ����� ���� ��� ����� ��� �� ����������� � ����������� ��� '${NAME}'."
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_GREEK} "�������� �� ���� ��� ������ �� ������������� ��� ����������� ���� ��� �� ������ �� �������������. ����� ���� ��� ������� ��� �� ����������."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_GREEK} "������� ���������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_GREEK} "�������� �� �������� ��� ������ �� �������������."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_GREEK} "���������"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_GREEK} "������� �� ������ ��� ��������� ���� ��� ��� �������� ��� �� ����� ��� ��������� ���."
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_GREEK} "�� ��������� ������������ �� ������������ �� '${NAME}' ���� �������� ������.$\r$\n$\r$\n��� �� �� ������������� ��� ������ ����, ����� ���� ��� �����������. ��� �� �� ������������� �� ���� ���� ������, ����� ���� ��� ��������� ��� �������� ������� ���� ������." " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_GREEK} "������� ����� ������������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_GREEK} "�������� �� ������ ���� ���� ����� �� ������������ �� '${NAME}'."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_GREEK} "������� ������������"
  !endif

  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_GREEK} "����������� �� �������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_GREEK} "�������� ���������� ��� �� '${NAME}' ������������."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_GREEK} "������������"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_GREEK} "� ����������� ������������ ��������."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_GREEK} "����� �������� ��� ������ �� ����������� ��� ����������� ��� '${NAME}';"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_GREEK} "������������� ��� '${NAME} ${VERSION}'"
  !endif
  
  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_GREEK} "���� �� ��������� �� �������������� �� '${NAME}' ��� ��� ���������� ���."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_GREEK} "������������� ��� '${NAME}'"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_GREEK} "�������� ��� '${NAME}' ��� ��� ���������� ���."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_GREEK} "������������� �� �������"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_GREEK} "�������� ���������� ��� �� '${NAME}' ��������������."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_GREEK} "������������"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_GREEK} "� ������������� ������������ ��������."
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_GREEK} "������������� ��� '${NAME} ${VERSION}'"
  !endif

!endif

!verbose 4