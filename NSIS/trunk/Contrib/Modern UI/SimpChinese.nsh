;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Simplified Chinese (2052)
;By Hotice 

;--------------------------------

!ifndef MUI_SIMPCHINESE_USED

!define MUI_SIMPCHINESE_USED

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_SIMPCHINESE} "��PageDown�Ķ����Э���ȫ������."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_SIMPCHINESE} "ѡȡ���밲װ�������ȡ��ѡȡ�����밲װ�����. �����һ������." " "
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_SIMPCHINESE} "��װ���򽫻ᰲװ ${NAME} �����µ��ļ���.$\r$\n$\r$\nȷ����װ�ڴ��ļ���, �����װ. ����װ����ͬ���ļ���, ��������ѡȡ�����ļ���." " "
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_SIMPCHINESE} "��һ�� >"
  !endif
   
  LangString MUI_TEXT_LICENSE_TITLE ${LANG_SIMPCHINESE} "���Э��"  
  LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_SIMPCHINESE} "��װ ${NAME} ǰ��������Э��."
  LangString MUI_INNERTEXT_LICENSE ${LANG_SIMPCHINESE} "������������Э���е�ȫ������, ѡȡ��ͬ�������װ. ���������Э����ܰ�װ ${NAME}."
  
  LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_SIMPCHINESE} "ѡȡ���"
  LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_SIMPCHINESE} "ѡȡ ${NAME} ������Ҫ��װ�Ĺ���."
  LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_SIMPCHINESE} "˵��"
  LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_SIMPCHINESE} "�ƶ����Ĺ�굽��һ����ϲ鿴����˵��."
  
  LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_SIMPCHINESE} "ѡȡ��װλ��"
  LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_SIMPCHINESE} "ѡȡ��װ ${NAME} ���ļ���."
  LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_SIMPCHINESE} "Ŀ���ļ���"
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_SIMPCHINESE} "��װ��"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_SIMPCHINESE} "${NAME} ���ڰ�װ�����Դ�Ƭ��."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_SIMPCHINESE} "����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_SIMPCHINESE} "��װ��˳�����."
  
  LangString MUI_MSGTEXT_ABORTWARNING ${LANG_SIMPCHINESE} "��ȷ��Ҫ���� ${NAME} ��װ����?"

  LangString MUI_BUTTONTEXT_BACK ${LANG_SIMPCHINESE} "< ��һ��"
  LangString MUI_BUTTONTEXT_NEXT ${LANG_SIMPCHINESE} "��һ�� >"
  LangString MUI_BUTTONTEXT_CANCEL ${LANG_SIMPCHINESE} "ȡ��"
  LangString MUI_BUTTONTEXT_INSTALL ${LANG_SIMPCHINESE} "��װ"

  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_SIMPCHINESE} "�⽫�������ϵͳ��ɾ�� ${NAME}."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_SIMPCHINESE} "��һ�� >"
  !endif
  
  LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_SIMPCHINESE} "ɾ�� ${NAME}"
  LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_SIMPCHINESE} "������ϵͳ��ɾ�� ${NAME}."
  
  LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_SIMPCHINESE} "ɾ����"
  LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_SIMPCHINESE} "${NAME} ����ɾ�������Դ�Ƭ��."
  
  LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_SIMPCHINESE} "����"
  LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_SIMPCHINESE} "ɾ����˳�����."
  
  LangString un.MUI_BUTTONTEXT_BACK ${LANG_SIMPCHINESE} "< ��һ��"
  LangString un.MUI_BUTTONTEXT_NEXT ${LANG_SIMPCHINESE} "��һ�� >"
  LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_SIMPCHINESE} "ȡ��"
  LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_SIMPCHINESE} "ɾ��"
    
!endif
