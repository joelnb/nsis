;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Bulgarian (1026)
;Translated by Asparouh Kalyandjiev [acnapyx@sbline.net]

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "BULGARIAN"

  !define MUI_LANGNAME "Bulgarian" ;Name of the language in the language itself

  !define MUI_TEXT_WELCOME_INFO_TITLE "����� ����� � �������������� ��������� �� $(^Name)."
  !define MUI_TEXT_WELCOME_INFO_TEXT "��� �� ��������� $(^Name) �� ����� ��������.\r\n\r\n���������� �� �� ��������� ������ ����� ����������, ����� �� ���������� ������������. ���� �� ������� �� ������������ �� ������ ����� �������� �������, ��� �� ���������� ���������.\r\n\r\n$_CLICK"
  
  !define MUI_TEXT_LICENSE_TITLE "�������� ������������"  
  !define MUI_TEXT_LICENSE_SUBTITLE "���� ����������� ���������� ������� ����� ������������� �� $(^Name)."
  !define MUI_INNERTEXT_LICENSE_TOP "��������� 'Page Down', �� �� ������ ���������� ���� �� ��������������."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "��� �������� ������ ������� �� ��������������, �������� '��������', �� �� ����������. ������ �� �������� ��������������, �� �� ����������� $(^Name)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "If you accept the terms of the agreement, click the check box below. You must accept the agreement to install $(^Name). $_CLICK"
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "If you accept the terms of the agreement, select the first option below. You must accept the agreement to install $(^Name). $_CLICK"
  
  !define MUI_TEXT_COMPONENTS_TITLE "�������� ������������"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "�������� ��� ������� ��  $(^Name) ������� �� ����� �����������."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "��������"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "��������� � ������� ��� ��������� ���������, �� �� ������ ���������� ��."
  
  !define MUI_TEXT_DIRECTORY_TITLE "�������� ����� �� ������������"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "�������� �������, � ����� $(^Name) �� �� ���������."
  
  !define MUI_TEXT_INSTALLING_TITLE "�����������"
  !define MUI_TEXT_INSTALLING_SUBTITLE "���� ���������, ������ $(^Name) �� ���������."
  
  !define MUI_TEXT_FINISH_TITLE "������������ �������"
  !define MUI_TEXT_FINISH_SUBTITLE "������������ ������� �������."
  
  !define MUI_TEXT_ABORT_TITLE "Installation Aborted"
  !define MUI_TEXT_ABORT_SUBTITLE "Setup was not completed successfully."
  
  !define MUI_BUTTONTEXT_FINISH "&��������"
  !define MUI_TEXT_FINISH_INFO_TITLE "���������� �� ���������� �� ���������� �� $(^Name)"
  !define MUI_TEXT_FINISH_INFO_TEXT "$(^Name) � ���������� �� ������ �������.\r\n��������� '��������', �� �� ��������� ����������."
  !define MUI_TEXT_FINISH_INFO_REBOOT "���������� ������ �� ���� �����������, �� �� ������� ������������ �� $(^Name). ������� �� �� ������������ ����?"
  !define MUI_TEXT_FINISH_REBOOTNOW "������� ����"
  !define MUI_TEXT_FINISH_REBOOTLATER "����� �� ����������� ����� ��-�����"
  !define MUI_TEXT_FINISH_RUN "��������� $(^Name)"
  !define MUI_TEXT_FINISH_SHOWREADME "������ Readme"
  
  !define MUI_TEXT_STARTMENU_TITLE "�������� ����� � Start ������"
  !define MUI_TEXT_STARTMENU_SUBTITLE "�������� ����� � Start ������ �� ����������� ��� ����������."
  !define MUI_INNERTEXT_STARTMENU_TOP "�������� ����� � Start ������, � ����� ������� �� ��������� ��������� ��� ��������� �� ����������. ������ ���� ���� �� �������� ���, �� �� ��������� ���� �����."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "�� �������� ���������"
  
  !define MUI_TEXT_ABORTWARNING "������� �� ���, �� ������� �� �� �������� ������������ �� $(^Name)?"  
  
  
  !define MUI_UNTEXT_CONFIRM_TITLE "������������ �� $(^Name)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "���������� �� $(^Name) �� ������ �������."
  
  !define MUI_UNTEXT_LICENSE_TITLE "�������� ������������"  
  !define MUI_UNTEXT_LICENSE_SUBTITLE "Please review the license terms before uninstalling $(^Name)."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to uninstall $(^Name)."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "If you accept the terms of the agreement, click the check box below. You must accept the agreement to uninstall $(^Name). $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "If you accept the terms of the agreement, select the first option below. You must accept the agreement to uninstall $(^Name). $_CLICK"
  
  !define MUI_UNTEXT_COMPONENTS_TITLE "Choose Components"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "Choose which features of $(^Name) you want to uninstall."
    
  !define MUI_UNTEXT_DIRECTORY_TITLE "Choose Uninstall Location"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "Choose the folder from which to uninstall $(^Name)."
  
  !define MUI_UNTEXT_UNINSTALLING_TITLE "�������������"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "���� ���������, ������ $(^Name) �� �����������."
    
  !define MUI_UNTEXT_FINISH_TITLE "��������"
  !define MUI_UNTEXT_FINISH_SUBTITLE "�������������� �������� �������."
  
  !define MUI_UNTEXT_ABORT_TITLE "Uninstallation Aborted"
  !define MUI_UNTEXT_ABORT_SUBTITLE "Uninstall was not completed successfully."
  
!insertmacro MUI_LANGUAGEFILE_END