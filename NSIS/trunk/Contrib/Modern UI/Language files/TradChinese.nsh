;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: 'Chinese (Traditional)' (1028)
;Translator: Kii Ali <kiiali@cpatch.org>
;Revision date: 2003-09-11
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "TRADCHINESE"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Chinese (Traditional)" ;(�H�y���������覡�A�g�U�y���W��) Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_HEADER "�s�ө���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_HEADER "9"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_TITLE "�s�ө���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_TITLE "9"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "�w��ϥ� $(^Name) �w�˺��F"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "�o�N�|�b�A���q���A�w�� $(^Name) �C\r\n\r\n�b�}�l�w�ˤ��e�A��ĳ��������L�Ҧ����ε{���C�o�N���\\�u�w�˵{���v��s���w���t���ɮסA�Ӥ��ݭn���s�ҰʧA���q���C\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "���v��ĳ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "�b�w�� $(^Name) ���e�A���˾\���v���ڡC"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "�˾\��ĳ����l�����A�Ы� [PgDn] ���U���ʭ����C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "�p�G�A������ĳ�������ڡA���@�U [�ڦP�N(I)] �~��w�ˡC�p�G�A��� [����(C)] �A�w�˵{���N�|�����C�����n������ĳ�~��w�� $(^Name) �C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "�p�G�A������ĳ�������ڡA���@�U�U�誺�Ŀ�ءC�����n������ĳ�~��w�� $(^Name)�C$_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "�p�G�A������ĳ�������ڡA��ܤU��Ĥ@�ӿﶵ�C�����n������ĳ�~��w�� $(^Name)�C$_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "�������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "��� $(^Name) ���A�Q�n�w�˪��\��C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "�y�z"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "���ʧA���ƹ����Ш줸�󤧤W�A�K�i���쥦���y�z�C"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "����w�˦�m" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "��� $(^Name) �n�w�˪���Ƨ��C"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "���b�w��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "$(^Name) ���b�w�ˡA�е��ԡC"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "�w�˧���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "�w�˵{���w���\�a���槹���C"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "�w�ˤv����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "�w�˵{���å����\�a���槹���C"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "����(&F)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "���� $(^Name) �w�˺��F"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name) �w�b�A���t�Φw�ˡC\r\n���@�U [����(F)] ���������F�C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "�A���t�λݭn���s�ҰʡA�H�K���� $(^Name) ���w�ˡC�{�b�n���s�ҰʶܡH"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "�O�A�{�b���s�Ұ�(&Y)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "�_�A�ڵy��A�ۦ歫�s�Ұ�(&N)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "���� $(^Name)(&R)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "��ܡuŪ���ɮסv(&M)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "��ܡu�}�l�\���v��Ƨ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "��ܡu�}�l�\���v��Ƨ��A�Ω�{�������|�C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "��ܡu�}�l�\���v��Ƨ��A�H�K�إߵ{�������|�C�A�]�i�H��J�W�١A�إ߷s��Ƨ��C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "���n�إ߱��|(&N)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�A�T�w�n���} $(^Name) �w�˵{���H"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "�Ѱ��w�� $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "�q�A���q���Ѱ��w�� $(^Name) �C"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "���v��ĳ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "�b�Ѱ��w�� $(^Name) ���e�A���˾\���v���ڡC"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "�p�G�A������ĳ�������ڡA���@�U [�ڦP�N(I)] �~��Ѱ��w�ˡC�p�G�A��� [����(C)] �A�w�˵{���N�|�����C�����n������ĳ�~��Ѱ��w�� $(^Name) �C"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "�p�G�A������ĳ�������ڡA���@�U�U�誺�Ŀ�ءC�����n������ĳ�~��Ѱ��w�� $(^Name)�C$_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "�p�G�A������ĳ�������ڡA��ܤU��Ĥ@�ӿﶵ�C�����n������ĳ�~��Ѱ��w�� $(^Name)�C$_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "�������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "��� $(^Name) ���A�Q�n�Ѱ��w�˪��\��C"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_TITLE "����Ѱ��w�˦�m" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_SUBTITLE "��� $(^Name) �n�Ѱ��w�˪���Ƨ��C"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "���b�Ѱ��w��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "$(^Name) ���b�Ѱ��w�ˡA�е��ԡC"
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "�Ѱ��w�ˤw����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "�Ѱ��w�˵{���w���\�a���槹���C"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "�Ѱ��w�ˤw����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "�Ѱ��w�˵{���å����\�a���槹���C"
  
!insertmacro MUI_LANGUAGEFILE_END
