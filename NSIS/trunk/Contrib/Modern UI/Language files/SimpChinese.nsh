;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.64

;Language: 'Chinese (Simplified)' (2052)
;Kii Ali <kiiali@cpatch.org>
;Revision date: 2003-05-02
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SIMPCHINESE"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Chinese (Simplified)" ;(�����Ա���ķ�ʽ��д����������) Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_HEADER "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_HEADER "9"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_TITLE "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_TITLE "9"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "���� [��һ��(N)] ������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "���� [��װ(I)] ��ʼ��װ��"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "��ӭʹ�� ${MUI_PRODUCT} ��װ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "�⽫������ļ��������װ ${MUI_PRODUCT} ��\r\n\r\n�ڿ�ʼ��װ֮ǰ�������ȹر���������Ӧ�ó����⽫������װ���򡱸���ָ����ϵͳ�ļ���������Ҫ����������ļ������\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "���֤Э��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "�ڰ�װ ${MUI_PRODUCT} ֮ǰ���������Ȩ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "�������֤Э������ಿ�֣��밴 [PgDn] ���¾�ҳ�档"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "�����ͬ�����к�Լ�е�������� [��ͬ��(I)] ������װ�������ѡ�� [ȡ��(C)] ����װ���򽫻�رա�����Ҫ�������֤Э����ܰ�װ ${MUI_PRODUCT} ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "�����������֤Э���е���������·��ĸ�ѡ�򡣱���Ҫ�������֤Э����ܰ�װ ${MUI_PRODUCT}��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "�����������֤Э���е����ѡ���·���һ��ѡ�����Ҫ�������֤Э����ܰ�װ ${MUI_PRODUCT}��"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "ѡ�����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "ѡ�� ${MUI_PRODUCT} ��������Ҫ��װ�Ĺ��ܡ�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "��ѡ��Ҫ��װ����������Ѳ��밲װ�����ȡ����ѡ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "�ƶ�������ָ�뵽���֮�ϣ���ɼ�������������"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "ѡ����װλ��" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "ѡ�� ${MUI_PRODUCT} Ҫ��װ���ļ��С�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "��װ�����������ļ��У���װ ${MUI_PRODUCT} ��$\r$\n$\r$\nҪ��װ������ļ��У����� [��װ(I)] ��Ҫ��װ�ڲ�ͬ�ļ��У����� [���(B)...] ��ѡ�������ļ��С�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Ŀ���ļ���"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "���ڰ�װ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "${MUI_PRODUCT} ���ڰ�װ����Ⱥ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "��װ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "��װ�����ѳɹ���������ɡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "��װ����ֹ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "��װ����δ�ɹ���������ɡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "���(&F)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "��� ${MUI_PRODUCT} ��װ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} �������ϵͳ��װ��\r\n���� [���(F)] �رմ��򵼡�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "���ϵͳ��Ҫ�����������Ա���� ${MUI_PRODUCT} �İ�װ������Ҫ����������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "�ǣ�������������(&Y)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "�����Ժ���������������(&N)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "���� ${MUI_PRODUCT}(&R)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "��ʾ�������ļ���(&M)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "ѡ�񡰿�ʼ�˵����ļ���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "ѡ�񡰿�ʼ�˵����ļ��У����ڳ���Ŀ�ݷ�ʽ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "ѡ�񡰿�ʼ�˵����ļ��У��Ա㴴������Ŀ�ݷ�ʽ����Ҳ�����������ƣ��������ļ��С�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "��Ҫ������ݷ�ʽ(&N)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "��ȷʵҪ�˳� ${MUI_PRODUCT} ��װ����"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "���� [�Ƴ�(U)] ��ť����ʼ�����װ��"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "�����װ ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "����ļ���������װ ${MUI_PRODUCT} ��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "����򵼽�����ļ���������װ ${MUI_PRODUCT} ��"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "���ڽ����װ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "${MUI_PRODUCT} ���ڽ����װ����Ⱥ�"
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "�����װ�����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "�����װ�����ѳɹ���������ɡ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "�����װ����ֹ"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "�����װ����δ�ɹ���������ɡ�"
  
!insertmacro MUI_LANGUAGEFILE_END
