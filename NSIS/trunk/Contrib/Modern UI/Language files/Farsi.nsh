;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.67

;Language: Farsi (1065)
;By FzerorubigD

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "FARSI"

  !define MUI_LANGNAME "Farsi" ;Use only ASCII characters (if this is not possible, use the English name)
  
  !define MUI_TEXT_WELCOME_INFO_TITLE "  �� ������ ���$(^NameDA) ��� �����  "
  !define MUI_TEXT_WELCOME_INFO_TEXT "��� ������ ��� �� ���� ���  $(^NameDA) �������� ����.\r\n\r\n������� ����� ���� ������ ��� ��� �� ��� �� ����� ��� ������. ��� ��� �� ������ ��� ����� ����� �� ���� ���� �� ��� ������ ���� ������� ��� ��� �� ����� ���.\r\n\r\n$_CLICK"
  
  !define MUI_TEXT_LICENSE_TITLE "��������� ���"  
  !define MUI_TEXT_LICENSE_SUBTITLE "���� ��� �� ���  $(^NameDA) ���� ������ ��������� �� ���� ����."
  !define MUI_INNERTEXT_LICENSE_TOP "�� Ϙ�� ��� Page Up , Down ���� ���� ���� ���� �� ������� ����."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "ǐ� ��� ���� ������ ��������� �� ���� ����� �� ��� Ϙ�� ������ ��� ����. ��� ���� ���� ����� �� ���� ���  $(^NameDA) ���� ����� �����."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "ǐ� ���� ������ ��������� �� ���� ����� �� �ǘ� ��� �� ������ ����.��� ���� ���� ������ ��������� �� ���� ��� $(^NameDA) ���� ����� �����. $_CLICK"
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "ǐ� ���� ������ ��������� �� ���� ����� , ������ ����� �� ������ ����.��� ���� ���� ������ ��������� �� ���� ��� $(^NameDA) ���� ����� �����. $_CLICK"
  
  !define MUI_TEXT_COMPONENTS_TITLE "������ ����"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "������ ���� ���� � �� ������ ���  $(^NameDA) �� �������� ��� ����."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "�������"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "����� ���� �� �� ��� �� ���� �������� �� ����� ����� �� �� �� ������ ����."
  
  !define MUI_TEXT_DIRECTORY_TITLE "������ ��� ���"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "������ ���� �� �� ��������  $(^NameDA) �� �� ��� ���."
  
  !define MUI_TEXT_INSTALLING_TITLE "�� ��� ���"
  !define MUI_TEXT_INSTALLING_SUBTITLE "���� �� ����� �� $(^NameDA) �� ��� ��� ��� ��� ����."
  
  !define MUI_TEXT_FINISH_TITLE "��� ����� ����"
  !define MUI_TEXT_FINISH_SUBTITLE "������ ��� $(^NameDA) �� ������ ����� ����."
  
  !define MUI_TEXT_ABORT_TITLE "������ ��� ��� ��"
  !define MUI_TEXT_ABORT_SUBTITLE "������ ��� $(^NameDA) �� ������ �� ����� �����."
  
  !define MUI_BUTTONTEXT_FINISH "&�����"
  !define MUI_TEXT_FINISH_INFO_TITLE "������ ��� $(^NameDA) ����� ����"
  !define MUI_TEXT_FINISH_INFO_TEXT "$(^NameDA) �� ��� ������� ��� ��� ��.\r\n\r\n���� ���� �� ��� Ϙ�� ����� ��� ����."
  !define MUI_TEXT_FINISH_INFO_REBOOT "������� ��� ���� ���� ����� ���  $(^NameDA) ������ ��� ������ ���. �� �������� ���� ��� ��� �� ����� ���Ͽ"
  !define MUI_TEXT_FINISH_REBOOTNOW "������� ���� ������ ��� ������ ���."
  !define MUI_TEXT_FINISH_REBOOTLATER "���� ���� ��� ��� �� ����� �����."
  !define MUI_TEXT_FINISH_RUN "&����� $(^NameDA)"
  !define MUI_TEXT_FINISH_SHOWREADME "&����� ���� �������"
  
  !define MUI_TEXT_STARTMENU_TITLE "������ ���� �� ���� ������ ��"
  !define MUI_TEXT_STARTMENU_SUBTITLE "������ ���� �� ���� ������ �� ���� ����� ������ ��� $(^NameDA) �� ��."
  !define MUI_INNERTEXT_STARTMENU_TOP "���� �� �� �������� ������ ��� ������ �� �� ����� ���� �� ������ ����. ��� �������� � ��� �� ���� ����� � ���� ���� ��� ����"
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "������� ����� ����"
  
  !define MUI_TEXT_ABORTWARNING "���� ���Ͽ  $(^Name) ��� ��� ������� �� �������� �� ������ ���"  
  
  
  !define MUI_UNTEXT_WELCOME_INFO_TITLE "�� ������ ���  $(^NameDA) ��� �����."
  !define MUI_UNTEXT_WELCOME_INFO_TEXT "��� ������ ��� �� ���� ��� $(^NameDA) �� ��� ���������� �� ����.\r\n\r\n��� �� ���� ������ ��� ����� ���� �� $(^NameDA) �� ��� ���� ����.\r\n\r\n$_CLICK"
  
  !define MUI_UNTEXT_CONFIRM_TITLE "��� $(^NameDA)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "��� $(^NameDA) �� ��� ������� ���."
  
  !define MUI_UNTEXT_LICENSE_TITLE "���������"  
  !define MUI_UNTEXT_LICENSE_SUBTITLE "���� ���� ������ ��������� �� ��� �� ���  $(^NameDA) ���� ����."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "ǐ� ��� ���� ������ ��������� �� ���� ����� �� ��� Ϙ�� ������ ��� ����. ��� ���� ���� ����� �� ���� ��� $(^NameDA) ���� ����� �����"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "ǐ� ���� ������ ��������� �� ���� ����� �� �ǘ� ��� �� ������ ����.��� ���� ���� ������ ��������� �� ����  ���$(^NameDA) ���� ����� �����. $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "ǐ� ���� ������ ��������� �� ���� ����� , ������ ����� �� ������ ����.��� ���� ���� ������ ��������� �� ���� ��� $(^NameDA) ���� ����� �����. $_CLICK"
  
  !define MUI_UNTEXT_COMPONENTS_TITLE "������ ����"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "�������� �� $(^NameDA) �� �� �������� ��� ���� �� ������ ����."
  
  !define MUI_UNTEXT_DIRECTORY_TITLE "������ ��� ���"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "���� �� �� ��������  $(^NameDA) �� �� ��� ��� �� ������ ����."
  
  !define MUI_UNTEXT_UNINSTALLING_TITLE "�� ��� ���"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "���� ��  $(^NameDA) �� ��� ��� ��� ��� ��� ����."
    
  !define MUI_UNTEXT_FINISH_TITLE "������ ��� ����� ����"
  !define MUI_UNTEXT_FINISH_SUBTITLE "������ ��� $(^NameDA) �� ������ ����� ����."
  
  !define MUI_UNTEXT_ABORT_TITLE "������ ��� ��� ��."
  !define MUI_UNTEXT_ABORT_SUBTITLE "������ ��� $(^NameDA) �� ������ ����� �����."
  
  !define MUI_UNTEXT_FINISH_INFO_TITLE "����� ������ ���$(^NameDA)"
  !define MUI_UNTEXT_FINISH_INFO_TEXT "$(^NameDA) �� ��� ������� ��� ��� ��..\r\n\r\n���� ���� �� ������ ��� �� ��� Ϙ�� ����� ��� ����.."
  
  !define MUI_UNTEXT_ABORTWARNING "���� ���Ͽ $(^Name) ��� ������� �� �������� �� ������ ��� "  
  
!insertmacro MUI_LANGUAGEFILE_END