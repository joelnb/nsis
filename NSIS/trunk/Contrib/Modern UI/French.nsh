;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: French (1036)
;By S�bastien Delahaye <seb@delahaye.net>

;--------------------------------

!ifndef MUI_FRENCH_USED

!define MUI_FRENCH_USED

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_FRENCH} "Appuyez sur Page Down pour lire le reste de la licence utilisateur."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_FRENCH} "Cochez les composants que vous souhaitez installer, et d�cochez ceux que vous ne voulez pas installer. Cliquez sur Suivant pour continuer." " "
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_FRENCH} "Le programme d'installation va maintenant installer ${NAME} dans le dossier suivant.$\r$\n$\r$\nPour l'installer dans ce dossier, cliquez sur Installer. Pour l'installer dans un autre dossier, cliquez sur Parcourir et choisissez un autre dossier." " "
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_FRENCH} "Suivant >"
  !endif
   
  LangString MUI_TEXT_LICENSE_TITLE ${LANG_FRENCH} "Licence utilisateur"  
  LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_FRENCH} "Veuillez examiner les termes de la licence avant d'installer ${NAME}."
  LangString MUI_INNERTEXT_LICENSE ${LANG_FRENCH} "Si vous acceptez tous les termes de la licence utilisateur, cliquez sur D'accord pour continuer. Si vous choisissez Annuler, le programme d'installation s'arr�tera. Vous devez accepter la licence utilisateur pour installer ${NAME}."
  
  LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_FRENCH} "Choisissez les composants"
  LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_FRENCH} "Choisissez les composants que vous souhaitez installer."
  LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_FRENCH} "Description"
  LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_FRENCH} "Passer le curseur de votre souris sur un composant pour voir sa description."
  
  LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_FRENCH} "Choisissez le dossier d'installation"
  LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_FRENCH} "Choisissez le dossier dans lequel installer ${NAME}."
  LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_FRENCH} "Dossier d'installation"
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_FRENCH} "Installation en cours"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_FRENCH} "Veuillez patienter pendant que ${NAME} est en train d'�tre install� sur votre ordinateur."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_FRENCH} "Installation termin�e"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_FRENCH} "L'installation s'est termin�e avec succ�s."
  
  LangString MUI_MSGTEXT_ABORTWARNING ${LANG_FRENCH} "�tes-vous s�r de vouloir quitter l'installation de ${NAME} ?"

  LangString MUI_BUTTONTEXT_BACK ${LANG_FRENCH} "< Pr�c�dent"
  LangString MUI_BUTTONTEXT_NEXT ${LANG_FRENCH} "Suivant >"
  LangString MUI_BUTTONTEXT_CANCEL ${LANG_FRENCH} "Annuler"
  LangString MUI_BUTTONTEXT_INSTALL ${LANG_FRENCH} "Installer"

  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_FRENCH} "Ce programme va supprimer ${NAME} de votre ordinateur."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_FRENCH} "Suivant >"
  !endif
  
  LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_FRENCH} "D�sinstaller ${NAME}"
  LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_FRENCH} "Supprimer ${NAME} de votre ordinateur."
  
  LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_FRENCH} "D�sinstallation en cours"
  LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_FRENCH} "Veuillez patienter pendant que ${NAME} est en train d'�tre supprim� de votre ordinateur."
  
  LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_FRENCH} "D�sinstallation termin�e"
  LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_FRENCH} "La d�sinstallation s'est termin�e avec succ�s."
  
  LangString un.MUI_BUTTONTEXT_BACK ${LANG_FRENCH} "< Pr�c�dent"
  LangString un.MUI_BUTTONTEXT_NEXT ${LANG_FRENCH} "Suivant >"
  LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_FRENCH} "Annuler"
  LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_FRENCH} "D�sinstaller"
    
!endif