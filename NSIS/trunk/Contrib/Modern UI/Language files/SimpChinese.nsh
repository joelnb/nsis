;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: 'Chinese (Simplified)' (2052)
;Translator: Kii Ali <kiiali@cpatch.org>
;Revision date: 2003-09-11
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SIMPCHINESE"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Chinese (Simplified)" ;(�����Ա���ķ�ʽ��д����������) Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_HEADER "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_HEADER "9"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_TITLE "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_TITLE "9"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "��ӭʹ�� $(^Name) ��װ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "�⽫������ļ��������װ $(^Name) ��\r\n\r\n�ڿ�ʼ��װ֮ǰ�������ȹر���������Ӧ�ó����⽫������װ���򡱸���ָ����ϵͳ�ļ���������Ҫ����������ļ������\r\n\r\n$_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "���֤Э��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "�ڰ�װ $(^Name) ֮ǰ���������Ȩ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "����Э������ಿ�֣��밴 [PgDn] ���¾�ҳ�档"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "��������Э���е�������� [��ͬ��(I)] ������װ�������ѡ�� [ȡ��(C)] ����װ���򽫻�رա�����Ҫ����Э����ܰ�װ $(^Name) ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "��������Э���е���������·��Ĺ�ѡ�򡣱���Ҫ����Э����ܰ�װ $(^Name)��$_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "��������Э���е����ѡ���·���һ��ѡ�����Ҫ����Э����ܰ�װ $(^Name)��$_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "ѡ�����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "ѡ�� $(^Name) ��������Ҫ��װ�Ĺ��ܡ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "�ƶ�������ָ�뵽���֮�ϣ���ɼ�������������"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "ѡ����װλ��" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "ѡ�� $(^Name) Ҫ��װ���ļ��С�"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "���ڰ�װ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "$(^Name) ���ڰ�װ����Ⱥ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "��װ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "��װ�����ѳɹ���������ɡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "��װ����ֹ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "��װ����δ�ɹ���������ɡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "���(&F)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "��� $(^Name) ��װ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name) �������ϵͳ��װ��\r\n���� [���(F)] �رմ��򵼡�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "���ϵͳ��Ҫ�����������Ա���� $(^Name) �İ�װ������Ҫ����������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "�ǣ�������������(&Y)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "�����Ժ���������������(&N)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "���� $(^Name)(&R)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "��ʾ�������ļ���(&M)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "ѡ�񡰿�ʼ�˵����ļ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "ѡ�񡰿�ʼ�˵����ļ��У����ڳ���Ŀ�ݷ�ʽ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "ѡ�񡰿�ʼ�˵����ļ��У��Ա㴴������Ŀ�ݷ�ʽ����Ҳ�����������ƣ��������ļ��С�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "��Ҫ������ݷ�ʽ(&N)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "��ȷʵҪ�˳� $(^Name) ��װ����"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "�����װ $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "����ļ���������װ $(^Name) ��"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "���֤Э��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "�ڽ����װ $(^Name) ֮ǰ���������Ȩ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "��������Э���е�������� [��ͬ��(I)] ���������װ�������ѡ�� [ȡ��(C)] ����װ���򽫻�رա�����Ҫ����Э����ܽ����װ $(^Name) ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "��������Э���е���������·��Ĺ�ѡ�򡣱���Ҫ����Э����ܽ����װ $(^Name)��$_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "��������Э���е����ѡ���·���һ��ѡ�����Ҫ����Э����ܽ����װ $(^Name)��$_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "ѡ�����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "ѡ�� $(^Name) ��������Ҫ�����װ�Ĺ��ܡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_TITLE "ѡ�������װλ��" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_SUBTITLE "ѡ�� $(^Name) Ҫ�����װ���ļ��С�"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "���ڽ����װ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "$(^Name) ���ڽ����װ����Ⱥ�"
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "�����װ�����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "�����װ�����ѳɹ���������ɡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "�����װ����ֹ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "�����װ����δ�ɹ���������ɡ�"
  
!insertmacro MUI_LANGUAGEFILE_END
