;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Traditional Chinese (1028)
;By Yi-Ting Cheng (matini_yt@yahoo.com.tw)

;--------------------------------

!ifndef MUI_TRADCHINESE_USED

!define MUI_TRADCHINESE_USED

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_TRADCHINESE} "��PageDown�\Ū���v�X�����������e."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_TRADCHINESE} "����z�Q�w�˪�����è�������z���Q�w�˪�����. �I��U�@�B�~��." " "
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_TRADCHINESE} "�w�˵{���N�|�w�� ${NAME} �ܥH�U����Ƨ�.$\r$\n$\r$\n�T�w�w�˦b����Ƨ�, �I��w��. ���w�˨줣�P����Ƨ�, �I���s���ÿ���䥦��Ƨ�." " "
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_TRADCHINESE} "�U�@�B >"
  !endif
   
  LangString MUI_TEXT_LICENSE_TITLE ${LANG_TRADCHINESE} "���v�X��"  
  LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_TRADCHINESE} "�w�� ${NAME} �e�и�Ū���v�X��."
  LangString MUI_INNERTEXT_LICENSE ${LANG_TRADCHINESE} "�p�G�z�������v�X��������������, ����ڦP�N�~��w��. �z���������X���~��w�� ${NAME}."
  
  LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_TRADCHINESE} "�������"
  LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_TRADCHINESE} "��� ${NAME} ���z�Q�n�w�˪��\��."
  LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_TRADCHINESE} "����"
  LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_TRADCHINESE} "���ʱz����Ш���@����W�d�ݥ�������."
  
  LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_TRADCHINESE} "����w�˦�m"
  LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_TRADCHINESE} "����w�� ${NAME} ����Ƨ�."
  LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_TRADCHINESE} "�ت���Ƨ�"
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_TRADCHINESE} "�w�ˤ�"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_TRADCHINESE} "${NAME} ���b�w�ˤ��еy�ݤ���."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_TRADCHINESE} "����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_TRADCHINESE} "�w�ˤw���Q����."
  
  LangString MUI_MSGTEXT_ABORTWARNING ${LANG_TRADCHINESE} "�z�T�w�n���� ${NAME} �w�˵{��?"

  LangString MUI_BUTTONTEXT_BACK ${LANG_TRADCHINESE} "< �W�@�B"
  LangString MUI_BUTTONTEXT_NEXT ${LANG_TRADCHINESE} "�U�@�B >"
  LangString MUI_BUTTONTEXT_CANCEL ${LANG_TRADCHINESE} "����"
  LangString MUI_BUTTONTEXT_INSTALL ${LANG_TRADCHINESE} "�w��"

  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_TRADCHINESE} "�o�N�|�q�z���t�Τ����� ${NAME}."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_TRADCHINESE} "�U�@�B >"
  !endif
  
  LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_TRADCHINESE} "���� ${NAME}"
  LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_TRADCHINESE} "�q�z���t�Τ����� ${NAME}."
  
  LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_TRADCHINESE} "������"
  LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_TRADCHINESE} "${NAME} ���b�������еy�ݤ���."
  
  LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_TRADCHINESE} "����"
  LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_TRADCHINESE} "�����w���Q����."
  
  LangString un.MUI_BUTTONTEXT_BACK ${LANG_TRADCHINESE} "< �W�@�B"
  LangString un.MUI_BUTTONTEXT_NEXT ${LANG_TRADCHINESE} "�U�@�B >"
  LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_TRADCHINESE} "����"
  LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_TRADCHINESE} "����"
    
!endif