;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: 'Chinese (Traditional)' (1028)
;By Kii Ali <kiiali@cpatch.org>

;--------------------------------
!verbose 3

!ifndef MUI_TRADCHINESE_USED

!define MUI_TRADCHINESE_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\TradChinese.nlf"

  !define MUI_TRADCHINESE_LANGNAME "Chinese (Traditional)" ;�H�y���������覡�A�g�U�y���W�� (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_TRADCHINESE} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_TRADCHINESE} "�Y�n�ݱ��v�X������l�����A�Ы� [PgDn] ���U���ʭ����C"
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_TRADCHINESE} "���v�X��"
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_TRADCHINESE} "�b�w�� ${MUI_PRODUCT} ���e�A���˾\���v���ڡC"
     LangString MUI_INNERTEXT_LICENSE ${LANG_TRADCHINESE} "�p�G�A�P�N�Ҧ��X���������ڡA��� [�ڦP�N(A)] �~��w�ˡC�p�G�A��� [����(C)] �A�w�˵{���N�|�����C�����n�������v�X���~��w��  ${MUI_PRODUCT}�C"
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_TRADCHINESE} "�֨��Q�n�w�˪�����A�ç⤣�Q�w�˪�����Ѱ��֨��C�� [�U�@�B(N)] �~��C"
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_TRADCHINESE} "�������"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_TRADCHINESE} "��� ${MUI_PRODUCT} ���A�Q�n�w�˪�����C"
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_TRADCHINESE} "�y�z"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_TRADCHINESE} "���ʧA���ƹ����Ш줸�󤧤W�A�K�i���쥦���y�z�C"
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_TRADCHINESE} "�w�˵{���N�b�U�C��Ƨ��A�w�� ${MUI_PRODUCT} �C$\r$\n$\r$\n�n�w�˨�o�Ӹ�Ƨ��A���@�U [�w��(I)] �C�n�w�˦b���P��Ƨ��A���@�U [�s��(B)...] �ÿ�ܨ�L��Ƨ��C"
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_TRADCHINESE} "����w�˦�m" 
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_TRADCHINESE} "��� ${MUI_PRODUCT} �n�w�˪���Ƨ���m�C"
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_TRADCHINESE} "�ت���Ƨ�"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_TRADCHINESE} "���b�w��" 
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_TRADCHINESE} "${MUI_PRODUCT} ���b�w�ˡA�е��ԡC"
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_TRADCHINESE} "����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_TRADCHINESE} "�w�˵{���w���\�a���槹���C"
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_TRADCHINESE} "�A�T�w�n���} ${MUI_PRODUCT} �w�˵{���H"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_TRADCHINESE} "${MUI_PRODUCT} ${MUI_VERSION} �w��"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_TRADCHINESE} "�o�N�|�q�A���t�Τ��Ѱ��w�� ${MUI_PRODUCT}�C"
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_TRADCHINESE} "�Ѱ��w�� ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_TRADCHINESE} "�q�A���t�θѰ��w�� ${MUI_PRODUCT} �C"
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_TRADCHINESE} "���b�Ѱ��w��"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_TRADCHINESE} "${MUI_PRODUCT} ���b�Ѱ��w�ˡA�е��ԡC"
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_TRADCHINESE} "����"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_TRADCHINESE} "${MUI_PRODUCT} �w�q�A���t�θѰ��w�ˡC"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_TRADCHINESE} "${MUI_PRODUCT} ${MUI_VERSION} �w��"
  !endif
    
!endif

!verbose 4