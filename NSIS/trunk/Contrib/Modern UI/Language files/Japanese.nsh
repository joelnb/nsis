;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Japanese (1041)
;By Dnanako

;Translation updated by Takahiro Yoshimura <takahiro_y@monolithworks.co.jp>

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "JAPANESE"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Japanese" ;(���{��) Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_HEADER "�l�r �o�S�V�b�N"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_HEADER "9"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONT_TITLE "�l�r �o�S�V�b�N"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_FONTSIZE_TITLE "12"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "$(^Name) �Z�b�g�A�b�v �E�B�U�[�h�ւ悤����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "���̃E�B�U�[�h�́A$(^Name)�̃C���X�g�[�����K�C�h���Ă����܂��B\r\n\r\n�Z�b�g�A�b�v���J�n����O�ɁA���̂��ׂẴA�v���P�[�V�������I�����邱�Ƃ𐄏����܂��B����ɂ���āA�Z�b�g�A�b�v�����̃R���s���[�^���ċN�������ɁA�m���ɃV�X�e�� �t�@�C�����A�b�v�f�[�g���邱�Ƃ��o����悤�ɂȂ�܂��B\r\n\r\n$_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "���C�Z���X�_��"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "$(^Name)���C���X�g�[������O�ɁA���C�Z���X�������m�F���Ă��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "[Page Down]�������Č_�񏑂����ׂĂ��ǂ݂��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A[���ӂ���] ��I��ŃC���X�g�[���𑱂��Ă��������B$(^Name) ���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A���̃`�F�b�N�{�b�N�X���N���b�N���Ă��������B$(^Name) ���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A���ɕ\������Ă���I�v�V�����̂����A�ŏ��̂��̂�I��ŉ������B$(^Name) ���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B $_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "�R���|�[�l���g��I��ł��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "$(^Name)�̃C���X�g�[�� �I�v�V������I��ł��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "����"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "�R���|�[�l���g�̏�Ƀ}�E�X �J�[�\�����ړ�����ƁA�����ɐ������\������܂��B"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "�C���X�g�[�����I��ł��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "$(^Name)���C���X�g�[������t�H���_��I��ł��������B"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "�C���X�g�[��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "$(^Name)���C���X�g�[�����Ă��܂��B���΂炭���҂����������B"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "�C���X�g�[���̊���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "�C���X�g�[���ɐ������܂����B"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "�C���X�g�[���̒��~"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "�Z�b�g�A�b�v�͐���Ɋ�������܂���ł����B"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "����(&F)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "$(^Name) �Z�b�g�A�b�v �E�B�U�[�h�͊������܂����B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name)�́A���̃R���s���[�^�ɃC���X�g�[������܂����B\r\n\r\n�E�B�U�[�h�����ɂ� [����] �������Ă��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "$(^Name) �̃C���X�g�[������������ɂ́A���̃R���s���[�^���ċN������K�v������܂��B�������ċN�����܂����H"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "�������ċN������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "��Ŏ蓮�ōċN������"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "$(^Name)�����s(&R)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Readme ��\������(&S)"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "�X�^�[�g���j���[ �t�H���_��I��ł��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "$(^Name)�̃V���[�g�J�b�g���쐬����X�^�[�g���j���[ �t�H���_��I��ŉ������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "���̃v���O�����̃V���[�g�J�b�g���쐬�������X�^�[�g���j���[ �t�H���_��I�����Ă��������B�܂��A�쐬����V�����t�H���_�ɖ��O�����邱�Ƃ��ł��܂��B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "�V���[�g�J�b�g���쐬���Ȃ�"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "$(^Name) �Z�b�g�A�b�v�𒆎~���܂����H"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "$(^Name)�̃A���C���X�g�[��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "$(^Name)�����̃R���s���[�^����폜���܂��B"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "���C�Z���X�_��"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "$(^Name)���A���C���X�g�[������O�ɁA���C�Z���X�������m�F���Ă��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A[���ӂ���] ��I��ŃA���C���X�g�[���𑱂��Ă��������B$(^Name) ���A���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A���̃`�F�b�N�{�b�N�X���N���b�N���Ă��������B$(^Name) ���A���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "�_�񏑂̂��ׂĂ̏����ɓ��ӂ���Ȃ�΁A���ɕ\������Ă���I�v�V�����̂����A�ŏ��̂��̂�I��ŉ������B$(^Name) ���A���C���X�g�[������ɂ́A�_�񏑂ɓ��ӂ���K�v������܂��B $_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "�R���|�[�l���g��I��ł��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "$(^Name)�̃A���C���X�g�[�� �I�v�V������I��ł��������B"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_TITLE "�A���C���X�g�[������I��ł��������B"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_SUBTITLE "$(^Name)���A���C���X�g�[������t�H���_��I��ł��������B"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "�A���C���X�g�[��"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "$(^Name)���A���C���X�g�[�����Ă��܂��B���΂炭���҂����������B"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "�A���C���X�g�[���̊���"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "�A���C���X�g�[���ɐ������܂����B"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "�A���C���X�g�[���̒��~"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "�A���C���X�g�[���͐���Ɋ�������܂���ł����B"
  
!insertmacro MUI_LANGUAGEFILE_END