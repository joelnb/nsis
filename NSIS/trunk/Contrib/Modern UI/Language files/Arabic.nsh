;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.63

;Language: Arabic (1025)
;By asdfuae@msn.com

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "ARABIC"

  !define MUI_LANGNAME "Arabic" ;(����) Use only ASCII characters (if this is not possible, use the English name)
  
  !define MUI_TEXT_WELCOME_INFO_TITLE "$(^Name) ����� �� �� ���� ������"
  !define MUI_TEXT_WELCOME_INFO_TEXT "�� ��� ���� ���� ����� �������� $(^Name).\r\n\r\n�� ������ ����� ���� ������� ��� �������.��� ������ �� ����� ����� ������ �� ��� ������ ������ ����� ������ �� ����.\r\n\r\n $_CLICK"
  
  !define MUI_TEXT_LICENSE_TITLE "�������� �������"  
  !define MUI_TEXT_LICENSE_SUBTITLE "������ ������ �������� ������� ��� ����� $(^Name)."
  !define MUI_INNERTEXT_LICENSE_TOP "���� ���� ������ ����� �������� �������"
  !define MUI_INNERTEXT_LICENSE_BOTTOM "���� ����� ������ ������� �� ����� ��� ���� �������� �������, �� ������ ������� ���� �������� ��� �������� ����� $(^Name)."
  
  !define MUI_TEXT_COMPONENTS_TITLE "���� ������� �������"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "���� ������� ������ ������� �� ���� $(^Name)."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "�����"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "��� ����� ��� ��� ������� ������ ����� �� ����"
  
  !define MUI_TEXT_DIRECTORY_TITLE "���� ���� �������"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "���� ������ ������ ����� ��� �������� $(^Name)."
  
  !define MUI_TEXT_INSTALLING_TITLE "��������"
  !define MUI_TEXT_INSTALLING_SUBTITLE "������ �������� ���� ����� $(^Name)."
  
  !define MUI_BUTTONTEXT_FINISH "&�����"
  !define MUI_TEXT_FINISH_TITLE "�������� �� �����"
  !define MUI_TEXT_FINISH_SUBTITLE "�������� �� ����� ����� ��������"
  !define MUI_TEXT_FINISH_INFO_TITLE "���� ���� ������ $(^Name)"
  !define MUI_TEXT_FINISH_INFO_TEXT "$(^Name) ����� �� �����\r\n���� ����� ������� �� ������"
  !define MUI_TEXT_FINISH_INFO_REBOOT "$(^Name)��� ����� ����� ������ ������ ����� �������� . �� ���� ������� ����"
  !define MUI_TEXT_FINISH_REBOOTNOW "��� ������� ����"
  !define MUI_TEXT_FINISH_REBOOTLATER "���� �� ����� ����� ������ �� ��� ���."
  !define MUI_TEXT_FINISH_RUN "$(^Name) ���"
  !define MUI_TEXT_FINISH_SHOWREADME "���� ������"
  
  !define MUI_TEXT_STARTMENU_TITLE "���� ���� ������ �����"
  !define MUI_TEXT_STARTMENU_SUBTITLE "���� ���� ������ ����� ��������� �������"
  !define MUI_INNERTEXT_STARTMENU_TOP "���� ���� ������ ����� ���� ������ ��� �������� ��������. ����� ���� ����� ��� ������ ���� ����."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "�� ���� ��������"
   
  !define MUI_TEXT_ABORTWARNING "�� ��� ����� �� ����� ���� ������ $(^Name)�"
  
  
  !define MUI_UNTEXT_CONFIRM_TITLE "���� $(^Name)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "����� $(^Name) �� �����"
    
  !define MUI_UNTEXT_UNINSTALLING_TITLE "�����"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "������ �������� ���� ����� $(^Name)."
  
  !define MUI_UNTEXT_FINISH_TITLE "�����"
  !define MUI_UNTEXT_FINISH_SUBTITLE "��� ������� ����� � ��������"

!insertmacro MUI_LANGUAGEFILE_END