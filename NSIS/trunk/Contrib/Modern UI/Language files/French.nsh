;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.5

;Language: French (1036)
;By S�bastien Delahaye <seb@delahaye.net>

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "FRENCH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Fran�ais" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licence utilisateur"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Veuillez examiner les termes de la licence avant d'installer ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Appuyez sur Page Down pour lire le reste de la licence utilisateur."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Si vous acceptez tous les termes de la licence utilisateur, cliquez sur J'accepte pour continuer. Vous devez accepter la licence utilisateur pour installer ${MUI_PRODUCT}."  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Choisissez les composants"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Choisissez les composants que vous souhaitez installer."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS "Cochez les composants que vous souhaitez installer, et d�cochez ceux que vous ne voulez pas installer. Cliquez sur Suivant pour continuer."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Description"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Passer le curseur de votre souris sur un composant pour voir sa description."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Choisissez le dossier d'installation"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Choisissez le dossier dans lequel installer ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Le programme d'installation va maintenant installer ${MUI_PRODUCT} dans le dossier suivant.$\r$\n$\r$\nPour l'installer dans ce dossier, cliquez sur Installer. Pour l'installer dans un autre dossier, cliquez sur Parcourir et choisissez un autre dossier."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Dossier d'installation"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Installation en cours"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Veuillez patienter pendant que ${MUI_PRODUCT} est en train d'�tre install� sur votre ordinateur."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISHED_TITLE "Installation termin�e"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISHED_SUBTITLE "L'installation s'est termin�e avec succ�s."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_WINDOWTITLE "Dossier du menu D�marrer" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Choisissez un dossier dans le menu D�marrer" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Choisissez un dossier dans le menu D�marrer pour les raccourcis de l'application." 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU "Choisissez le dossier du menu D�marrer dans lequel vous voulez placer les raccourcis du programme. Vous pouvez �galement entrer un nouveau nom pour cr�er un nouveau dossier. Cliquez sur Installer pour d�marrer l'installation." 
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�tes-vous s�r de vouloir quitter l'installation de ${MUI_PRODUCT} ?"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WINDOWTITLE "Installation de ${MUI_NAME}"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "D�sinstaller ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Supprimer ${MUI_PRODUCT} de votre ordinateur."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Ce programme va supprimer ${MUI_PRODUCT} de votre ordinateur."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "D�sinstallation en cours"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Veuillez patienter pendant que ${MUI_PRODUCT} est en train d'�tre supprim� de votre ordinateur."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_TITLE "D�sinstallation termin�e"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_SUBTITLE "La d�sinstallation s'est termin�e avec succ�s."
   
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_WINDOWTITLE "D�sinstallation de ${MUI_NAME}"
    
!insertmacro MUI_LANGUAGEFILE_END