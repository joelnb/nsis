;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Ukrainian (1058)
;By Yuri Holubow, Our Soft (http://www.ns.lviv.ua)

;--------------------------------
!verbose 3

!ifndef MUI_UKRAINIAN_USED

!define MUI_UKRAINIAN_USED

  !define MUI_UKRAINIAN_LANGNAME "Ukainian" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_UKRAINIAN} "������i�� PageDown ��� ����������� ������� �����."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_UKRAINIAN} "�i����i��� �����"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_UKRAINIAN} "����������� ����� ����� ����� i�������i�� ${NAME}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_UKRAINIAN} "���� �� �������� ��i ����� �����, ������i�� �� ������ ������. �� ������i �������� ����� ����� ��� i�������i� ${NAME}."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_UKRAINIAN} "�i��i���� �i ����������, ��i �� ������ ����������, i ��i�i�� �i��i��� ��� ���, ��i �� ������������� �� ������. ������i�� ���i ��� �����������."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_UKRAINIAN} "�����i�� ����������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_UKRAINIAN} "�����i�� ��i ��������i ${NAME} �� ������ ����������."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_UKRAINIAN} "����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_UKRAINIAN} "�i����i�� ���� ����� �� ����������, ��� �������� ���� ����."
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_UKRAINIAN} "I��������� ���������� ${NAME} � ��������� �������.$\r$\n$\r$\n��� ���������� � ��� �������, ������i�� ����������. ��� ���������� � i���� ������� ������i�� ������� i �����i�� i���� �������." " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_UKRAINIAN} "�����i�� �i��� ���������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_UKRAINIAN} "�����i�� ������� ��� ��������� ${NAME}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_UKRAINIAN} "������� �����������"
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_UKRAINIAN} "&���i >"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_UKRAINIAN} "��� ���������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_UKRAINIAN} "����-����� ���������, ���� ��� ��������� ${NAME}."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_UKRAINIAN} "���������"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_UKRAINIAN} "��������� ���i��� ���������."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_MSGTEXT_ABORTWARNING ${LANG_UKRAINIAN} "�� ��������i �� ������ �������� ��������� ${NAME}?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_BUTTONTEXT_BACK ${LANG_UKRAINIAN} "< &�����"
    LangString MUI_BUTTONTEXT_NEXT ${LANG_UKRAINIAN} "&���i >"
    LangString MUI_BUTTONTEXT_CANCEL ${LANG_UKRAINIAN} "���������"
    LangString MUI_BUTTONTEXT_INSTALL ${LANG_UKRAINIAN} "&����������"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_UKRAINIAN} "�� �������� �������� ${NAME} � ������ ����'�����."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_UKRAINIAN} "��������� ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_UKRAINIAN} "��������� ${NAME} � ������ ����'�����."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_UKRAINIAN} "���������"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_UKRAINIAN} "����-����� ��������� ���� ��������� ��������� ${NAME}."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_UKRAINIAN} "���������"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_UKRAINIAN} "��������� ���i��� ���������."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_UKRAINIAN} "&���i >"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_BUTTONTEXT_BACK ${LANG_UKRAINIAN} "< &�����"
    LangString un.MUI_BUTTONTEXT_NEXT ${LANG_UKRAINIAN} "&���i >"
    LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_UKRAINIAN} "���������"
    LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_UKRAINIAN} "&��������"
  !endif  
    
!endif

!verbose 4