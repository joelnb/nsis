;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: French (1036)
;By S�bastien Delahaye <seb@delahaye.net>

;--------------------------------
!verbose 3

!ifndef MUI_FRENCH_USED

!define MUI_FRENCH_USED

  LoadLanguageFile "${NSISDIR}\Contrib\Language files\French.nlf"

  !define MUI_FRENCH_LANGNAME "Fran�ais" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  Name /LANG=${LANG_FRENCH} "${MUI_NAME}"
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_FRENCH} "Appuyez sur Page Down pour lire le reste de la licence utilisateur."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_FRENCH} "Licence utilisateur"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_FRENCH} "Veuillez examiner les termes de la licence avant d'installer ${MUI_PRODUCT}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_FRENCH} "Si vous acceptez tous les termes de la licence utilisateur, cliquez sur J'accepte pour continuer. Vous devez accepter la licence utilisateur pour installer ${MUI_PRODUCT}."  
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_FRENCH} "Cochez les composants que vous souhaitez installer, et d�cochez ceux que vous ne voulez pas installer. Cliquez sur Suivant pour continuer."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_FRENCH} "Choisissez les composants"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_FRENCH} "Choisissez les composants que vous souhaitez installer."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_FRENCH} "Description"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_FRENCH} "Passer le curseur de votre souris sur un composant pour voir sa description."
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_FRENCH} "Le programme d'installation va maintenant installer ${MUI_PRODUCT} dans le dossier suivant.$\r$\n$\r$\nPour l'installer dans ce dossier, cliquez sur Installer. Pour l'installer dans un autre dossier, cliquez sur Parcourir et choisissez un autre dossier."
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_FRENCH} "Choisissez le dossier d'installation"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_FRENCH} "Choisissez le dossier dans lequel installer ${MUI_PRODUCT}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_FRENCH} "Dossier d'installation"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_FRENCH} "Installation en cours"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_FRENCH} "Veuillez patienter pendant que ${MUI_PRODUCT} est en train d'�tre install� sur votre ordinateur."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_FRENCH} "Installation termin�e"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_FRENCH} "L'installation s'est termin�e avec succ�s."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_FRENCH} "�tes-vous s�r de vouloir quitter l'installation de ${MUI_PRODUCT} ?"
  !endif

  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_FRENCH} "Installation de ${MUI_PRODUCT} ${MUI_VERSION}"
  !endif
  
  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_FRENCH} "Ce programme va supprimer ${MUI_PRODUCT} de votre ordinateur."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_FRENCH} "D�sinstaller ${MUI_PRODUCT}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_FRENCH} "Supprimer ${MUI_PRODUCT} de votre ordinateur."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_FRENCH} "D�sinstallation en cours"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_FRENCH} "Veuillez patienter pendant que ${MUI_PRODUCT} est en train d'�tre supprim� de votre ordinateur."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_FRENCH} "D�sinstallation termin�e"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_FRENCH} "La d�sinstallation s'est termin�e avec succ�s."
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_FRENCH} "Installation de ${MUI_PRODUCT} ${MUI_VERSION}"
  !endif
    
!endif

!verbose 4