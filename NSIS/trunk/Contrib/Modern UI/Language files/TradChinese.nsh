;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Traditional Chinese (1028)
;By Yi-Ting Cheng (matini_yt@yahoo.com.tw)

;--------------------------------

!ifndef MUI_TRADCHINESE_USED

!define MUI_TRADCHINESE_USED

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_TRADCHINESE} "�� [PageDown] �[�ݦX������l�����C"
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_TRADCHINESE} "���v�X��"  
    LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_TRADCHINESE} "�b�w�� ${NAME} ���e���˾\���v���ڡC"
    LangString MUI_INNERTEXT_LICENSE ${LANG_TRADCHINESE} "�p�G�z�P�N�X�������Ҧ����ڡA��� [�ڦP�N] �~��w�ˡC�z���������X���~��w�� ${NAME}�C"
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_TRADCHINESE} "�ֿ�z�Q�n�w�˪�����A�øѰ��ֿ�z���Q�n�w�˪�����C�I�� [�U�@�B] �~��C"
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_TRADCHINESE} "�������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_TRADCHINESE} "��� ${NAME} ���z�Q�n�w�˪��\��C"
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_TRADCHINESE} "����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_TRADCHINESE} "���ʱz���ƹ��줸�󤧤W�d�ݥ��������C"
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_TRADCHINESE} "�w�˵{���N�|�w�� ${NAME} �ܤU�C��Ƨ��C$\r$\n$\r$\n�n�w�˦b����Ƨ��A�I�� [�w��]�C�n�w�˦b���P����Ƨ��A�I�� [�s��...] �ÿ�ܨ䥦��Ƨ��C" " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_TRADCHINESE} "����w�˦�m"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_TRADCHINESE} "����w�� ${NAME} ����Ƨ��C"
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_TRADCHINESE} "�ت���Ƨ�"
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_TRADCHINESE} "�U�@�B >"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_TRADCHINESE} "���b�w��"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_TRADCHINESE} "${NAME} ���b�w�ˤ��еy�ԡC"
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_TRADCHINESE} "����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_TRADCHINESE} "�w�ˤw���Q�����C"
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_MSGTEXT_ABORTWARNING ${LANG_TRADCHINESE} "�z�T�w�n���� ${NAME} �w�˵{��?"
  !endif

  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_BUTTONTEXT_BACK ${LANG_TRADCHINESE} "< �W�@�B"
    LangString MUI_BUTTONTEXT_NEXT ${LANG_TRADCHINESE} "�U�@�B >"
    LangString MUI_BUTTONTEXT_CANCEL ${LANG_TRADCHINESE} "����"
    LangString MUI_BUTTONTEXT_INSTALL ${LANG_TRADCHINESE} "�w��"
  !endif

  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_TRADCHINESE} "�o�N�|�q�z���t�Τ����� ${NAME}�C"
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_TRADCHINESE} "���� ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_TRADCHINESE} "�q�z���t�Τ����� ${NAME}�C"
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_TRADCHINESE} "���b����"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_TRADCHINESE} "${NAME} ���b�������еy�ԡC"
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_TRADCHINESE} "����"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_TRADCHINESE} "�����w���Q�����C"
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_TRADCHINESE} "�U�@�B >"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_BUTTONTEXT_BACK ${LANG_TRADCHINESE} "< �W�@�B"
    LangString un.MUI_BUTTONTEXT_NEXT ${LANG_TRADCHINESE} "�U�@�B >"
    LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_TRADCHINESE} "����"
    LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_TRADCHINESE} "����"
  !endif
    
!endif