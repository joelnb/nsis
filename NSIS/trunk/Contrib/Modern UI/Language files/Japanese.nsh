;NSIS Modern User Interface - Language File
;version 2 - Compatible with Modern UI 1.4

;Language: Japanese (1041)
;By Dnanako

;--------------------------------
!verbose 3

!ifndef MUI_JAPANESE_USED

!define MUI_JAPANESE_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\Japanese.nlf"

  !define MUI_JAPANESE_LANGNAME "Japanese" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_JAPANESE} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_JAPANESE} "[Page Down]�������Č_�񏑂����ׂĂ��ǂ݂��������B"
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_JAPANESE} "���C�Z���X�_��"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_JAPANESE} " ${MUI_PRODUCT} ���C���X�g�[������O�ɁA���C�Z���X�������m�F���Ă��������B"
     LangString MUI_INNERTEXT_LICENSE ${LANG_JAPANESE} "${MUI_PRODUCT} ���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B$\r$\n�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A[���ӂ���] ��I��ŃC���X�g�[���𑱂��Ă��������B"
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_JAPANESE} "�R���|�[�l���g���C���X�g�[������ɂ̓`�F�b�N���A�s�v�Ȃ�΁A�`�F�b�N���O���Ă��������B $\r$\n������ɂ�[����]�������Ă��������B"
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_JAPANESE} "�R���|�[�l���g��I��ł��������B"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_JAPANESE} "${MUI_PRODUCT} �̃C���X�g�[�� �I�v�V������I��ł��������B"
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_JAPANESE} "����"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_JAPANESE} "�R���|�[�l���g��Ƀ}�E�X �J�[�\�����ړ�����ƁA�����̐������\������܂��B"
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_JAPANESE} "${MUI_PRODUCT} ���ȉ��̃t�H���_�ɃC���X�g�[�����܂��B$\r$\n$\r$\n���̃t�H���_�ɃC���X�g�[������ɂ́A[�C���X�g�[��]�������Ă��������B$\r$\n�قȂ����t�H���_�ɃC���X�g�[������ɂ́A[�Q��]�������āA�ʂ̃t�H���_��I�����Ă��������B"
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_JAPANESE} "�C���X�g�[�����I��ł��������B"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_JAPANESE} "${MUI_PRODUCT} ���C���X�g�[������t�H���_��I��ł��������B"
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_JAPANESE} "�C���X�g�[���� �t�H���_"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_JAPANESE} "�C���X�g�[��"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_JAPANESE} "${MUI_PRODUCT} ���C���X�g�[�����Ă��܂��B���΂炭���҂����������B"
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_JAPANESE} "����"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_JAPANESE} "�C���X�g�[���ɐ������܂����B"
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_JAPANESE} "${MUI_PRODUCT} �̃C���X�g�[���𒆎~���܂����H"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_JAPANESE} "${MUI_PRODUCT} ${MUI_VERSION} �Z�b�g�A�b�v"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_JAPANESE} "${MUI_PRODUCT} �����̃V�X�e������A���C���X�g�[�����܂��B"
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_JAPANESE} "${MUI_PRODUCT} �̃A���C���X�g�[���B"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_JAPANESE} "${MUI_PRODUCT} �����̃V�X�e������A���C���X�g�[�����܂��B"
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_JAPANESE} "�A���C���X�g�[��"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_JAPANESE} "${MUI_PRODUCT} ���A���C���X�g�[�����Ă��܂��B���΂炭���҂����������B"
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_JAPANESE} "����"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_JAPANESE} "�A���C���X�g�[���ɐ������܂����B"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_JAPANESE} "${MUI_PRODUCT} ${MUI_VERSION} �Z�b�g�A�b�v"
  !endif
    
!endif

!verbose 4