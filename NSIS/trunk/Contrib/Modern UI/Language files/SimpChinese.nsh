;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: 'Chinese (Simplified)' (2052)
;By Kii Ali <kiiali@cpatch.org>

;--------------------------------
!verbose 3

!ifndef MUI_SIMPCHINESE_USED

!define MUI_SIMPCHINESE_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\SimpChinese.nlf"

  !define MUI_SIMPCHINESE_LANGNAME "Chinese (Simplified)" ;�����Ա���ķ�ʽ��д���������� (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_SIMPCHINESE} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_SIMPCHINESE} "��Ҫ����Ȩ��Լ�����ಿ�֣��밴 [PgDn] ���¾�ҳ�档"
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_SIMPCHINESE} "��Ȩ��Լ"
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_SIMPCHINESE} "�ڰ�װ ${MUI_PRODUCT} ֮ǰ���������Ȩ���"
     LangString MUI_INNERTEXT_LICENSE ${LANG_SIMPCHINESE} "�����ͬ�����к�Լ�е����ѡ�� [��ͬ��(A)] ������װ�������ѡ�� [ȡ��(C)] ����װ���򽫻�رա�����Ҫ������Ȩ��Լ���ܰ�װ  ${MUI_PRODUCT}��"
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_SIMPCHINESE} "��ȡ��Ҫ��װ����������Ѳ��밲װ����������ȡ���� [��һ��(N)] ������"
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_SIMPCHINESE} "ѡ�����"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_SIMPCHINESE} "ѡ�� ${MUI_PRODUCT} ������Ҫ��װ�������"
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_SIMPCHINESE} "����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_SIMPCHINESE} "�ƶ�������ָ�굽���֮�ϣ���ɼ�������������"
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_SIMPCHINESE} "��װ�����������ļ��У���װ ${MUI_PRODUCT} ��$\r$\n$\r$\nҪ��װ������ļ��У����� [��װ(I)] ��Ҫ��װ�ڲ�ͬ�ļ��У����� [���(B)...] ��ѡ�������ļ��С�"
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_SIMPCHINESE} "ѡ����װλ��" 
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_SIMPCHINESE} "ѡ�� ${MUI_PRODUCT} Ҫ��װ���ļ���λ�á�"
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_SIMPCHINESE} "Ŀ���ļ���"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_SIMPCHINESE} "���ڰ�װ" 
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_SIMPCHINESE} "${MUI_PRODUCT} ���ڰ�װ����Ⱥ�"
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_SIMPCHINESE} "���"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_SIMPCHINESE} "��װ�����ѳɹ���������ɡ�"
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_SIMPCHINESE} "��ȷʵҪ�˳� ${MUI_PRODUCT} ��װ����"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_SIMPCHINESE} "${MUI_PRODUCT} ${MUI_VERSION} ��װ"
  !endif
  

  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_SIMPCHINESE} "�⽫������ϵͳ�н����װ ${MUI_PRODUCT}��"
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_SIMPCHINESE} "�����װ ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_SIMPCHINESE} "�����ϵͳ�����װ ${MUI_PRODUCT} ��"
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_SIMPCHINESE} "���ڽ����װ"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_SIMPCHINESE} "${MUI_PRODUCT} ���ڽ����װ����Ⱥ�"
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_SIMPCHINESE} "���"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_SIMPCHINESE} "${MUI_PRODUCT} �Ѵ����ϵͳ�����װ��"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_SIMPCHINESE} "${MUI_PRODUCT} ${MUI_VERSION} ��װ"
  !endif

!endif

!verbose 4