;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Russian (1049)
;By Nik "brainsucker" Medved ; dev by Timon [ timon@front.ru ] + 20030720

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "RUSSIAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Russian"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "����� ���������� � ������ ��������� $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "��� ��������� ��������� $(^Name) �� ��� ���������.\r\n\r\n����� ������������ ���������, ������������� ������� ��� ���������� ����������. ��� �������� ��������� ��������� �������� ��������� ����� ��� ������������.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "������������ ����������"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "�������� ������� ������������� ���������� ����� ���������� $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "������� PageDown, ����� ���������� ����� ����."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "���� �� ���������� ������� ������������� ����������, ������� �� ������ ��������. �� ������ ������� ������� ���������� ��� ��������� $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "���� �� ���������� ������� ����������, ���������� ������� � ���������� ����. �� ������ ������� ������� ���������� ��� ��������� $(^Name). $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "���� �� ���������� ������� ����������, �������� ������ ������� �� ��������� ����. �� ������ ������� ������� ���������� ��� ��������� $(^Name). $_CLICK"  

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "���������� ��������������� ���������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "�������� ����� ����������� $(^Name) ��� �����."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "��������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "��������� ������ � ����������, ����� ������� ��� ��������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "����� ���������� ���������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "�������� ���������� ��� ��������� $(^Name)."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "����������� ������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "���������� ���������, ���� ��������� ��������� ��������� ��� ����������� ����� $(^Name)."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "��������� ���������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "��������� ���� ������� ���������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "��������� ��������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "��������� �� ���� ������� ���������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&���������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "���������� ������� ��������� $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name) ��� ���������� �� ��� ���������.\r\n\r\n������� ��������� ��� ������ �� ��������� ���������."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "��� ����, ����� �������� ��������� $(^Name) ��� ��������� ������ ���� ������������. �� ������� ������� ��� ������?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "��������������� ������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "� ���� ��������������� ������� �����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "&��������� $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "&�������� ���������� � ���������"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "���������� � ���� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "�������� ���������� � ���� ���� ��� ������� ���������."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "�������� ���������� � ���� ���� � ������� ����� �������� ������ ��� ��������������� ���������. �� ����� ������ ������ ������ ��� ��� �������� ����� ����������."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "�� ��������� ������"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�� �������, � ���, ��� ������� �������� ��������� $(^Name)?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "�������� $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "�������� $(^Name) � ������ ����������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "���������� ��������� ���������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "�������� ����� ����������� $(^Name) �� ������ �������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "��������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "���������� ���������, ��� �������� ������ $(^Name)."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "�������� ���������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "�������� ��������� ���� ������� ���������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "�������� ��������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "�������� ������ ����������� ���������."

!insertmacro MUI_LANGUAGEFILE_END