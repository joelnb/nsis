;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Korean (1042)
;By linak linak@korea.com / modified by koder@popdesk.co.kr ������ ���Ϸ� '��' ���� �ٶ��ϴ�.

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "KOREAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Korean"  ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "$(^Name) ��ġ �����翡 ���� ���� ȯ���մϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "�� ������� ����� ��ǻ�Ϳ� $(^Name)(��)�� ��ġ�� ���Դϴ�.\r\n\r\n��ġ�� �����ϱ� ���� ��� ���α׷��� �������ֽñ� �ٶ��ϴ�. ���α׷��� �����ϰ� �Ǹ� �ý����� ����� ���� �ʰ��� Ư���� �ý��� ������ ������ �� �ֱ� �����Դϴ�.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "��� ��� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "$(^Name)(��)�� ��ġ�Ͻñ� ���� ��� ��� ������ ���캸�ñ� �ٶ��ϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "��� ��� ���� ������ ������ �κ��� ���÷��� [Page Down] Ű�� ���� �ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "���뿡 ���� �ϼ̴ٸ� '������'�� ���� �ּ���. $(^Name)(��)�� ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "���뿡 ���� �ϼ̴ٸ� �Ʒ� ������ ������ �ּ���. $(^Name)(��)�� ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "���뿡 ���� �ϼ̴ٸ� ù��° ������ ������ �ּ���. $(^Name)(��)�� ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "���� ��� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "��ġ�ϰ��� �ϴ� $(^Name)�� ���� ��Ҹ� ������ �ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "�� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "�� ������ ���ð� ������ �κп� ���콺�� �÷���������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "��ġ ��ġ ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "$(^Name)(��)�� ��ġ �� ������ ������ �ּ���."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "��ġ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "$(^Name)(��)�� ��ġ�ϴ� ���� ��� ��ٷ� �ּ���."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "��ġ �Ϸ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "��ġ�� ���������� �̷�������ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "��ġ ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "��ġ�� ��� �Ǿ����ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "��ħ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "$(^Name) ��ġ ������ �Ϸ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name)�� ��ġ�� �Ϸ� �Ǿ����ϴ�. ��ġ �����縦 ��ġ���� '��ħ' ��ư�� ���� �ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "$(^Name)�� ��ġ�� �Ϸ��ϱ� ���ؼ��� �ý����� �ٽ� �����ؾ� �մϴ�. ���� ����� �Ͻðڽ��ϱ�?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "���� ����� �ϰڽ��ϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "���߿� ����� �ϰڽ��ϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "$(^Name) �����ϱ�(&R)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Readme ���� ����(&S)"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "���� �޴� ���� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "���α׷��� �ٷΰ��� �������� ������ ���� �޴� ���� ����."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "���α׷��� �ٷΰ��� �������� ������ ���� �޴� ������ �����ϼ���. ���ο� ������ �����Ϸ��� ���� �̸��� �Է��ϼ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "�ٷ� ���� �������� ������ �ʰڽ��ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "$(^Name) ��ġ�� ���� �Ͻðڽ��ϱ�?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "'����' ��ư�� ������ ���Ű� ���۵˴ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "$(^Name) ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "�ý��ۿ��� $(^Name) �����ϱ�"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "���� ��� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "�����ϰ��� �ϴ� $(^Name)�� ���� ��Ҹ� ������ �ּ���."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "$(^Name)(��)�� �����ϴ� ���� ��� ��ٷ� �ֽñ� �ٶ��ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "���� ��ħ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "���α׷��� ���������� �����Ͽ����ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "���α׷� ���� ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "���α׷� ���Ű� ��� �Ǿ����ϴ�."

!insertmacro MUI_LANGUAGEFILE_END