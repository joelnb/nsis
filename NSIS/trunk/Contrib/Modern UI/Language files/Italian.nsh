;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: Italian (1040)
;By SANFACE Software <sanface@sanface.com>

;--------------------------------
!verbose 3

!ifndef MUI_ITALIAN_USED

!define MUI_ITALIAN_USED

  !define MUI_ITALIAN_LANGNAME "Italiano" ;Name of the language in the language itself (English, Deutsch, Fran�ais, Italiano etc.)

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_ITALIAN} "Seleziona Page Down per vedere il resto della licenza d'uso."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_ITALIAN} "Licenza d'uso"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_ITALIAN} "Per favore esamina i termini della licenza d'uso prima di installare ${NAME}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_ITALIAN} "Se accetti i termini della licenza d'uso seleziona Accetto per continuare. Devi accettare i termini della licenza d'uso per installare ${NAME}."  
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_ITALIAN} "Seleziona i componenti che vuoi installare e deseleziona i componenti che non vuoi installare. Per continuare clicca su Sucessivo."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_ITALIAN} "Seleziona i componenti"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_ITALIAN} "Seleziona i componenti che vuoi installare."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_ITALIAN} "Descrizione"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_ITALIAN} "Per leggere una descrizione pi� approfondita dei componenti posiziona il puntatore del mouse sul componente di tuo interesse."
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_ITALIAN} "Il programma d'installazione installer� ${NAME} nella cartella selezionata.$\r$\n$\r$\nPer installare nella cartella selezionata clicca su Installa. Per installare in una cartella differente, clicca su Sfoglia e seleziona un'altra cartella." " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_ITALIAN} "Scegli la cartella di installazione"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_ITALIAN} "Scegli la cartella dove installare ${NAME}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_ITALIAN} "Cartella d'installazione"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_ITALIAN} "Installazione in corso"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_ITALIAN} "Per favore attendi che ${NAME} sia completamente installato."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_ITALIAN} "Installazione completata"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_ITALIAN} "L'installazione � stata completata con successo."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_ITALIAN} "Sei sicuro di voler terminare l'installazione di ${NAME} ?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_ITALIAN} "Installazione di ${NAME} ${VERSION}"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_ITALIAN} "Questo programma rimuover� ${NAME} dal vosto computer."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_ITALIAN} "Disinstalla ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_ITALIAN} "Rimuovi ${NAME} dal vostro computer."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_ITALIAN} "Disinstallazione in corso"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_ITALIAN} "Per favore attendi che ${NAME} sia completamente disinstallato."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_ITALIAN} "Disinstallazione completata"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_ITALIAN} "La disinstallazione � stata completata con successo."
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_ITALIAN} "Installazione di ${NAME} ${VERSION}"
  !endif
    
!endif

!verbose 4