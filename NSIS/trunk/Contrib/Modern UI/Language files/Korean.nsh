;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.65

;Language: Korean (1042)
;By linak linak@korea.com, modified by koder@popdesk.co.kr

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "KOREAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Korean" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "��� �Ͻ÷��� '����' ��ư�� �����ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "��ġ�� �����Ͻ÷��� '��ġ' ��ư�� �����ּ���."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "${MUI_PRODUCT} ��ġ �����翡 ���� ���� ȯ���մϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "�� ������� ����� ��ǻ�Ϳ� ${MUI_PRODUCT}(��)�� ��ġ�� ���Դϴ�.\r\n\r\n��ġ�� �����ϱ� ���� ��� ���α׷��� �������ֽñ� �ٶ��ϴ�. ���α׷��� �����ϰ� �Ǹ� �ý����� ����� ���� �ʰ��� Ư���� �ý��� ������ ������ �� �ֱ� �����Դϴ�.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "��� ��� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "${MUI_PRODUCT}(��)�� ��ġ�Ͻñ� ���� ��� ��� ������ ���캸�ñ� �ٶ��ϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "��� ��� ���� ������ ������ �κ��� ���÷��� [Page Down] Ű�� �����ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "���뿡 ���� �ϼ̴ٸ� '������'�� ���� �ּ���. ${MUI_PRODUCT}(��)�� ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "���뿡 ���� �ϼ̴ٸ� �Ʒ� ������ ������ �ּ���. ${MUI_PRODUCT}(��)�� ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "���뿡 ���� �ϼ̴ٸ� ù��° ������ ������ �ּ���. ${MUI_PRODUCT}(��)�� ��ġ�ϱ� ���ؼ��� �ݵ�� ���뿡 �����ϼž� �մϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "���� ��� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "��ġ�ϰ��� �ϴ� ${MUI_PRODUCT}�� ���� ��Ҹ� ������ �ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "��ġ�ϰ� ������ �κ��� ������ �ֽð�, ��ġ�ϰ� ���� ������ �κ��� �������� ���ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "�� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "�� ������ ���ð� ������ �κп� ���콺�� �÷���������."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "��ġ ��ġ ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "${MUI_PRODUCT}(��)�� ��ġ �� ������ ������ �ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "${MUI_PRODUCT}(��)�� ������ ������ ��ġ�� �����Դϴ�. $\r$\n$\r$\n�ٸ� ������ ��ġ�ϰ� �����ø� 'ã�ƺ���' ��ư�� ������ �ٸ� ������ �������ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "��ġ�� ����"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "��ġ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "${MUI_PRODUCT}(��)�� ��ġ�ϴ� ���� ��� ��ٷ� �ּ���."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "��ġ �Ϸ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "��ġ�� ���������� �̷�������ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "��ġ ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "��ġ�� ��� �Ǿ����ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "��ħ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "${MUI_PRODUCT} ��ġ ������ �Ϸ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT}�� ��ġ�� �Ϸ� �Ǿ����ϴ�. ��ġ �����縦 ��ġ���� '��ħ' ��ư�� �����ּ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "${MUI_PRODUCT}�� ��ġ�� �Ϸ��ϱ� ���ؼ��� �ý����� �ٽ� �����ؾ� �մϴ�. ���� ����� �Ͻðڽ��ϱ�?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "���� ����� �ϰڽ��ϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "���߿� ����� �ϰڽ��ϴ�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "${MUI_PRODUCT} �����ϱ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Readme ���� ����"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "���� �޴� ���� ����."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "���α׷��� �ٷΰ��� �������� ������ ���� �޴� ���� ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "���α׷��� �ٷΰ��� �������� ������ ���� �޴� ������ �����ϼ���. ���ο� ������ �����Ϸ��� ���� �̸��� �Է��ϼ���."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "�ٷ� ���� �������� ������ �ʰڽ��ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "${MUI_PRODUCT} ��ġ�� ���� �Ͻðڽ��ϱ�?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "'����' ��ư�� ������ ���Ű� ���۵˴ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "${MUI_PRODUCT} ����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "�ý��ۿ��� ${MUI_PRODUCT} �����ϱ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "�ý��ۿ��� ${MUI_PRODUCT}(��)�� ���� �� ���Դϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "${MUI_PRODUCT}(��)�� �����ϴ� ���� ��� ��ٷ� �ֽñ� �ٶ��ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "���� ��ħ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "���α׷��� ���������� �����Ͽ����ϴ�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "���α׷� ���� ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "���α׷� ���Ű� ��� �Ǿ����ϴ�."

!insertmacro MUI_LANGUAGEFILE_END