;Modern UI ��� ���
;������� ����� - ���� �� Modern UI 1.3

;Language: Arabic (1025)
;By asdfuae@msn.com

;--------------------------------

!ifndef MUI_ARABIC_USED

!define MUI_ARABIC_USED

  !define MUI_ARABIC_LANGNAME "Arabic" ;���� (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_ARABIC} "���� ���� ������ ����� �������� �������"
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_ARABIC} "�������� �������"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_ARABIC} "������ ������ �������� ������� ��� ����� ${NAME}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_ARABIC} "���� ����� ������ ������� �� ����� ��� ���� �������� ������ա �� ������ ������� ���� �������� ��� �������� ����� ${NAME}."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_ARABIC} "���� ������� ������ ������� � ��� ������� ����� �����ɡ �� ���� ������ ������ �������"
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_ARABIC} "���� ������� �������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_ARABIC} "���� ����� ������ ������� �� ${NAME}."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_ARABIC} "�����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_ARABIC} "��� ����� ��� ��� ������� ������ ����� �� ����"
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_ARABIC} "���� ����� �������� ${NAME} �� ������ ������$\r$\n$\r$\n���� ����� ������� �� ��� ������. ������� �� ���� ��ѡ ���� ���� � ���� ������ �����." " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_ARABIC} "���� ���� �������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_ARABIC} "���� ������ ������ ����� ��� �������� ${NAME}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_ARABIC} "������ ������"
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_ARABIC} "������ >"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_ARABIC} "��������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_ARABIC} "������ �������� ���� ����� ${NAME}."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_ARABIC} "�������� �� �����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_ARABIC} "�������� �� ����� ����� ��������"
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_MSGTEXT_ABORTWARNING ${LANG_ARABIC} "�� ��� ����� �� ����� ���� ${NAME}�"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_BUTTONTEXT_BACK ${LANG_ARABIC} "< ������"
    LangString MUI_BUTTONTEXT_NEXT ${LANG_ARABIC} "������ >"
    LangString MUI_BUTTONTEXT_CANCEL ${LANG_ARABIC} "�����"
    LangString MUI_BUTTONTEXT_INSTALL ${LANG_ARABIC} "�����"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_ARABIC} "��� ����� �� ����� �������� ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_ARABIC} "���� ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_ARABIC} "����� ${NAME} �� �����"
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_ARABIC} "�����"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_ARABIC} "������ �������� ���� ����� ${NAME}."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_ARABIC} "���"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_ARABIC} "��� ������� ����� � ��������"
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_ARABIC} "������& >"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_BUTTONTEXT_BACK ${LANG_ARABIC} "< ������"
    LangString un.MUI_BUTTONTEXT_NEXT ${LANG_ARABIC} "������ >"
    LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_ARABIC} "�����"
    LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_ARABIC} "�����&"
  !endif  
    
!endif