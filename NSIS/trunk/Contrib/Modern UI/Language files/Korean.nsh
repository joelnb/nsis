;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Korean (1042)
;By linak linak@korea.com 
;modified by koder@popdesk.co.kr ������ ���Ϸ� '��' ���� �ٶ��ϴ� / wini.pe.kr �� ���ø� ���ÿ����� ���� ���� ���ϴ�.
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "KOREAN"

  !define MUI_LANGNAME "Korean" ;Use only ASCII characters (if this is not possible, use the English name)

  !ifndef EUL_RUL
    !define EUL_RUL	"(��)��"	; ~��/�� ���� �ذ��� ���� ���� !insertmacro MUI_LANGUAGE "Korean" �ϱ� ���� define �� ������ȴ�.
  !endif	
  
  !define MUI_FONT "����"
  !define MUI_FONTSIZE "9"

  !define MUI_TEXT_WELCOME_INFO_TITLE "$(^Name) ��ġ �����翡 ���� ���� ȯ���մϴ�."
  !define MUI_TEXT_WELCOME_INFO_TEXT "�� ������� ����� ��ǻ�Ϳ� $(^Name)${EUL_RUL} ��ġ�� ���Դϴ�.\r\n\r\n��ġ�� �����ϱ� ���� ��� ���α׷��� �������ֽñ� �ٶ��ϴ�. ���α׷��� �����ϰ� �Ǹ� �ý����� ����� ���� �ʰ��� �ý��� ������ ������ �� �ֱ� �����Դϴ�.\r\n\r\n$_CLICK"

  !define MUI_TEXT_LICENSE_TITLE "��� ��� ����"
  !define MUI_TEXT_LICENSE_SUBTITLE "$(^Name)${EUL_RUL} ��ġ�Ͻñ� ���� ��� ��� ������ ���캸�ñ� �ٶ��ϴ�."
  !define MUI_INNERTEXT_LICENSE_TOP "��� ��� ���� ������ ������ �κ��� ���÷��� [Page Down] Ű�� ���� �ּ���."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "���뿡 ���� �ϼ̴ٸ� '������'�� ���� �ּ���. $(^Name)${EUL_RUL} ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "���뿡 ���� �ϼ̴ٸ� �Ʒ� ������ ������ �ּ���. $(^Name)${EUL_RUL} ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�. $_CLICK"
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "���뿡 ���� �ϼ̴ٸ� ù��° ������ ������ �ּ���. $(^Name)${EUL_RUL} ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�. $_CLICK"

  !define MUI_TEXT_COMPONENTS_TITLE "���� ��� ����"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "��ġ�ϰ��� �ϴ� $(^Name)�� ���� ��Ҹ� ������ �ּ���."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "�� ����"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "�� ������ ���ð� ������ �κп� ���콺�� �÷���������."

  !define MUI_TEXT_DIRECTORY_TITLE "��ġ ��ġ ����"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "$(^Name)${EUL_RUL} ��ġ �� ������ ������ �ּ���."

  !define MUI_TEXT_INSTALLING_TITLE "��ġ��"
  !define MUI_TEXT_INSTALLING_SUBTITLE "$(^Name)${EUL_RUL} ��ġ�ϴ� ���� ��� ��ٷ� �ּ���."

  !define MUI_TEXT_FINISH_TITLE "��ġ �Ϸ�"
  !define MUI_TEXT_FINISH_SUBTITLE "��ġ�� ���������� �̷�������ϴ�."

  !define MUI_TEXT_ABORT_TITLE "��ġ ���"
  !define MUI_TEXT_ABORT_SUBTITLE "��ġ�� ��� �Ǿ����ϴ�."

  !define MUI_BUTTONTEXT_FINISH "��ħ"
  !define MUI_TEXT_FINISH_INFO_TITLE "$(^Name) ��ġ ������ �Ϸ�"
  !define MUI_TEXT_FINISH_INFO_TEXT "$(^Name)�� ��ġ�� �Ϸ� �Ǿ����ϴ�. ��ġ �����縦 ��ġ���� '��ħ' ��ư�� ���� �ּ���."
  !define MUI_TEXT_FINISH_INFO_REBOOT "$(^Name)�� ��ġ�� �Ϸ��ϱ� ���ؼ��� �ý����� �ٽ� �����ؾ� �մϴ�. ���� ����� �Ͻðڽ��ϱ�?"
  !define MUI_TEXT_FINISH_REBOOTNOW "���� ����� �ϰڽ��ϴ�."
  !define MUI_TEXT_FINISH_REBOOTLATER "���߿� ����� �ϰڽ��ϴ�."
  !define MUI_TEXT_FINISH_RUN "$(^Name) �����ϱ�(&R)"
  !define MUI_TEXT_FINISH_SHOWREADME "Readme ���� ����(&S)"

  !define MUI_TEXT_STARTMENU_TITLE "���� �޴� ���� ����"
  !define MUI_TEXT_STARTMENU_SUBTITLE "���α׷��� �ٷΰ��� �������� ������ ���� �޴� ���� ����."
  !define MUI_INNERTEXT_STARTMENU_TOP "���α׷��� �ٷΰ��� �������� ������ ���� �޴� ������ �����ϼ���. ���ο� ������ �����Ϸ��� ���� �̸��� �Է��ϼ���."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "�ٷ� ���� �������� ������ �ʰڽ��ϴ�."

  !define MUI_TEXT_ABORTWARNING "$(^Name) ��ġ�� ���� �Ͻðڽ��ϱ�?"


  !define MUI_UNTEXT_CONFIRM_TITLE "$(^Name) ����"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "$(^Name) �����ϱ�"

  !define MUI_UNTEXT_LICENSE_TITLE "��� ��� ����"
  !define MUI_UNTEXT_LICENSE_SUBTITLE "$(^Name)${EUL_RUL} �����Ͻñ� ���� ��� ��� ������ ���캸�ñ� �ٶ��ϴ�."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "���뿡 ���� �ϼ̴ٸ� '������'�� ���� �ּ���. $(^Name)${EUL_RUL} �����ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "���뿡 ���� �ϼ̴ٸ� �Ʒ� ������ ������ �ּ���. $(^Name)${EUL_RUL} �����ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�. $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "���뿡 ���� �ϼ̴ٸ� ù��° ������ ������ �ּ���. $(^Name)${EUL_RUL} �����ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�. $_CLICK"

  !define MUI_UNTEXT_COMPONENTS_TITLE "���� ��� ����"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "�����ϰ��� �ϴ� $(^Name)�� ���� ��Ҹ� ������ �ּ���."

  !define MUI_UNTEXT_DIRECTORY_TITLE "���� ��ġ ����"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "$(^Name)${EUL_RUL} ������ ������ ������ �ּ���."

  !define MUI_UNTEXT_UNINSTALLING_TITLE "������"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "$(^Name)${EUL_RUL} �����ϴ� ���� ��� ��ٷ� �ֽñ� �ٶ��ϴ�."

  !define MUI_UNTEXT_FINISH_TITLE "���� ��ħ"
  !define MUI_UNTEXT_FINISH_SUBTITLE "���α׷��� ���������� �����Ͽ����ϴ�."

  !define MUI_UNTEXT_ABORT_TITLE "���α׷� ���� ���"
  !define MUI_UNTEXT_ABORT_SUBTITLE "���α׷� ���Ű� ��� �Ǿ����ϴ�."

!insertmacro MUI_LANGUAGEFILE_END
