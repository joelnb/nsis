;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: French (1036)
;By S�bastien Delahaye <seb@delahaye.net>

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "FRENCH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Fran�ais" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Cliquez sur Suivant pour continuer."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Cliquez sur Installer pour d�marrer l'installation."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Bienvenue dans le programme d'installation de $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Vous �tes sur le point d'installer $(^Name) sur votre ordinateur.\r\n\r\nAvant de d�buter l'installation, il est recommand� de fermer toutes les autres applications. Cela permettra au programme d'installation de mettre � jour certains fichiers syst�me sans avoir besoin de red�marrer votre ordinateur.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licence utilisateur"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Veuillez examiner les termes de la licence avant d'installer $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Appuyez sur Page Down pour lire le reste de la licence utilisateur."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Si vous acceptez les termes de la licence utilisateur, cliquez sur J'accepte pour continuer. Vous devez accepter la licence utilisateur pour installer $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Si vous acceptez les termes de la licence utilisateur, cochez la case ci-dessous. Vous devez accepter la licence utilisateur pour installer $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Si vous acceptez les termes de la licence utilisateur, s�lectionnez le premier choix ci-dessous. Vous devez accepter la licence utilisateur pour installer $(^Name)."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Choisissez les composants"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Choisissez les composants de $(^Name) que vous souhaitez installer."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Cochez les composants que vous souhaitez installer, et d�cochez ceux que vous ne voulez pas installer."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Description"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Passer le curseur de votre souris sur un composant pour voir sa description."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Choisissez le dossier d'installation"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Choisissez le dossier dans lequel installer $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Le programme d'installation va maintenant installer $(^Name) dans le dossier suivant.$\r$\n$\r$\nPour l'installer dans un autre dossier, cliquez sur Parcourir et choisissez un autre dossier."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Dossier d'installation"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Installation en cours"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Veuillez patienter pendant que $(^Name) est en train d'�tre install�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Installation termin�e"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "L'installation s'est termin�e avec succ�s."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Installation interrompue"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "L'installation n'a pas �t� termin�e."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Fermer"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Fin de l'installation de $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name) a �t� install� sur votre ordinateur.\r\n\r\nCliquez sur Fermer pour quitter le programme d'installation."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Votre ordinateur doit �tre red�marr� afin de compl�ter l'installation de $(^Name). Souhaitez-vous red�marrer maintenant ?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Red�marrer maintenant"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Je souhaite red�marrer moi-m�me plus tard"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Lancer $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Afficher le fichier Readme"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Choisissez un dossier dans le menu D�marrer"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Choisissez un dossier dans le menu D�marrer pour les raccourcis de l'application."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Choisissez le dossier du menu D�marrer dans lequel vous voulez placer les raccourcis du programme. Vous pouvez �galement entrer un nouveau nom pour cr�er un nouveau dossier."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Ne pas cr�er de raccourcis"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�tes-vous s�r de vouloir quitter l'installation de $(^Name) ?"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Cliquez sur D�sinstaller pour d�marrer la d�sinstallation."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "D�sinstaller $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "Supprimer $(^Name) de votre ordinateur."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "Licence utilisateur"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "Veuillez examiner les termes de la licence avant de d�sinstaller $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "Si vous acceptez les termes de la licence utilisateur, cliquez sur J'accepte pour continuer. Vous devez accepter la licence utilisateur pour d�sinstaller $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "Si vous acceptez les termes de la licence utilisateur, cochez la case ci-dessous. Vous devez accepter la licence utilisateur pour d�sintaller $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Si vous acceptez les termes de la licence utilisateur, s�lectionnez le premier choix ci-dessous. Vous devez accepter la licence utilisateur pour d�sinstaller $(^Name)."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "D�sinstallation en cours"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Veuillez patienter pendant que $(^Name) est en train d'�tre supprim� de votre ordinateur."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "Choisissez les composants"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "Cochez les composants de $(^Name) que vous souhaitez d�sinstaller."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_TITLE "Choisissez le dossier d'installation"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_SUBTITLE "Choisissez le dossier dans lequel vous voulez d�sinstaller $(^Name)."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "D�sinstallation termin�e"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "La d�sinstallation s'est termin�e avec succ�s."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "D�sinstallation interrompue"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "La d�sinstallation n'a pas �t� termin�e."

!insertmacro MUI_LANGUAGEFILE_END