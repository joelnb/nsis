;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Russian (1049)
;By Nik Medved (brainsucker)

;--------------------------------

!ifndef MUI_RUSSIAN_USED

!define MUI_RUSSIAN_USED

  !define MUI_RUSSIAN_LANGNAME "Russian" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_RUSSIAN} "������� PageDown ����� ����������� ������� ����������."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_RUSSIAN} "������������ ����������"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_RUSSIAN} "����������� ������� ���������� ����� ����������� ${NAME}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_RUSSIAN} "���� �� ���������� ��� ������� ����������, ������� �� ������ ��������. �� ������ ������� ������� ���������� ��� ���������� ${NAME}."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_RUSSIAN} "�������� �� ����������, ������� �� ������ ����������, � ������� ������� ��� ���, ������� �� ������������� �� ������. ������� ����� ��� �����������."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_RUSSIAN} "�������� ����������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_RUSSIAN} "�������� ����� ����������� ${NAME} �� ������ ����������."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_RUSSIAN} "��������"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_RUSSIAN} "��������� ���� ����� � ����������, ����� ������� ��� ��������."
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_RUSSIAN} "���������� ��������� ${NAME} � �������� �������.$\r$\n$\r$\n����� ���������� � ���� �������, ������� ����������. ����� ���������� � ������ ������� ������� ������� � �������� ������ �������." " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_RUSSIAN} "�������� ����� ���������"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_RUSSIAN} "�������� ������� ��� ��������� ${NAME}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_RUSSIAN} "������� ����������"
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_RUSSIAN} "&����� >"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_RUSSIAN} "���� ���������"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_RUSSIAN} "���������� ���������, ���� ���� ��������� ${NAME}."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_RUSSIAN} "���������"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_RUSSIAN} "��������� ������� ���������."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_MSGTEXT_ABORTWARNING ${LANG_RUSSIAN} "�� ������� ��� ������ �������� ��������� ${NAME}?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_BUTTONTEXT_BACK ${LANG_RUSSIAN} "< &�����"
    LangString MUI_BUTTONTEXT_NEXT ${LANG_RUSSIAN} "&����� >"
    LangString MUI_BUTTONTEXT_CANCEL ${LANG_RUSSIAN} "������"
    LangString MUI_BUTTONTEXT_INSTALL ${LANG_RUSSIAN} "&����������"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_RUSSIAN} "��� ��������� ������ ${NAME} � ������ ����������."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_RUSSIAN} "�������� ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_RUSSIAN} "�������� ${NAME} � ������ ����������."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_RUSSIAN} "��������"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_RUSSIAN} "���������� ��������� ���� ���������� �������� ${NAME}."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_RUSSIAN} "���������"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_RUSSIAN} "�������� ������� ���������."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_RUSSIAN} "&����� >"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_BUTTONTEXT_BACK ${LANG_RUSSIAN} "< &�����"
    LangString un.MUI_BUTTONTEXT_NEXT ${LANG_RUSSIAN} "&����� >"
    LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_RUSSIAN} "������"
    LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_RUSSIAN} "&�������"
  !endif  
    
!endif