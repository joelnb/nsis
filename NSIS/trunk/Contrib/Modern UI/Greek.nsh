;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Greek (1032)
;By Makidis N. Mike

;--------------------------------

!ifndef MUI_GREEK_USED

!define MUI_GREEK_USED

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_GREEK} "������� �� Page Down ��� �� ����� �� �������� ��� ������ ������."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_GREEK} "�������� �� ���� ��� ������ �� ������������� ��� ����������� ���� ��� �� ������ �� �������������. ����� ���� ��� ������� ��� �� ����������." " "
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_GREEK} "�� ��������� ������������ �� ������������ �� '${NAME}' ���� �������� ������.$\r$\n$\r$\n��� �� �� ������������� ��� ������ ����, ����� ���� ��� �����������. ��� �� �� ������������� �� ���� ���� ������, ����� ���� ��� ��������� ��� �������� ������� ���� ������." " "
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_GREEK} "������� >"
  !endif
   
  LangString MUI_TEXT_LICENSE_TITLE ${LANG_GREEK} "�������� ������ ������"  
  LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_GREEK} "������� ���� ����� ��� ������ ������ ���� ������������� �� '${NAME}'."
  LangString MUI_INNERTEXT_LICENSE ${LANG_GREEK} "��� ���������� ����� ���� ����� ��� ������ ������, ����� ���� ��� ������� ��� �� ����������. ��� ��������� �� �������, �� ��������� ������������ �� �����������. ������ �� ����������� �� �������� ������ ������ ��� �� ������������� �� '${NAME}'."
  
  LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_GREEK} "������� ���������"
  LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_GREEK} "�������� �� �������� ��� ������ �� �������������."
  LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_GREEK} "���������"
  LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_GREEK} "������� �� ������ ��� ��������� ���� ��� ��� �������� ��� �� ����� ��� ��������� ���."
  
  LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_GREEK} "������� ����� ������������"
  LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_GREEK} "�������� �� ������ ���� ���� ����� �� ������������ �� '${NAME}'."
  LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_GREEK} "������� ������������"
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_GREEK} "����������� �� �������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_GREEK} "�������� ���������� ��� �� '${NAME}' ������������."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_GREEK} "������������"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_GREEK} "� ����������� ������������ ��������."
  
  LangString MUI_MSGTEXT_ABORTWARNING ${LANG_GREEK} "����� �������� ��� ������ �� ����������� ��� ����������� ��� '${NAME}';"

  LangString MUI_BUTTONTEXT_BACK ${LANG_GREEK} "< ����"
  LangString MUI_BUTTONTEXT_NEXT ${LANG_GREEK} "������ >"
  LangString MUI_BUTTONTEXT_CANCEL ${LANG_GREEK} "�����"
  LangString MUI_BUTTONTEXT_INSTALL ${LANG_GREEK} "�����������"

  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_GREEK} "���� �� ��������� �� �������������� �� '${NAME}' ��� ��� ���������� ���."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_GREEK} "������� >"
  !endif
  
  LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_GREEK} "������������� ��� '${NAME}'"
  LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_GREEK} "�������� ��� '${NAME}' ��� ��� ���������� ���."
  
  LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_GREEK} "������������� �� �������"
  LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_GREEK} "�������� ���������� ��� �� '${NAME}' ��������������."
  
  LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_GREEK} "������������"
  LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_GREEK} "� ������������� ������������ ��������."
  
  LangString un.MUI_BUTTONTEXT_BACK ${LANG_GREEK} "< �����������"
  LangString un.MUI_BUTTONTEXT_NEXT ${LANG_GREEK} "������� >"
  LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_GREEK} "�����"
  LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_GREEK} "����������."
    
!endif