;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Italian (1040)
;By SANFACE Software <sanface@sanface.com>
;Review and update from v1.65 to v1.66 by Alessandro Staltari < staltari (a) geocities.com >

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "ITALIAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Italiano" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Benvenuti nel programma di installazione di $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Questo programma installer� $(^Name) nel vostro computer.\r\n\r\nSi raccomanda di chiudere tutte le altre applicazioni prima di iniziare l'installazione. Questo permetter� al programma di installazione di aggiornare i file di  sistema senza dover riavviare il computer.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licenza d'uso"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Prego leggere le condizioni della licenza d'uso prima di installare $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Premere Page Down per vedere il resto della licenza d'uso."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Se si accettano i termini della licenza d'uso scegliere Accetto per continuare. � necessario accettare i termini della licenza d'uso per installare $(^Name)."  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Se si accettano i termini della licenza d'uso, selezionare la casella sottostante. � necessario accettare i termini della licenza d'uso per installare $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Se si accettano i termini della licenza d'uso, selezionare la prima opzione sottostante. � necessario accettare i termini della licenza d'uso per installare $(^Name)."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Selezione dei componenti"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Selezionare i componenti di $(^Name) che si desidera installare."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Descrizione"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Posizionare il puntatore del mouse sul componente per vederne la descrizione."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Scelta della cartella di installazione"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Scegliere la cartella nella quale installare $(^Name)."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Installazione in corso"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Prego attendere mentre $(^Name)  viene installato."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Installazione completata"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "L'installazione � stata completata con successo."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Installazione interrotta"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "L'installazione non � stata completata correttamente."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Fine"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Completamento dell'installazione di $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name) � stato installato sul vostro computer.\r\n\r\nScegliere Fine per chiudere il programma di installazione."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Il computer deve essere riavviato per completare l'installazione di $(^Name). Si desidera riavviarlo adesso?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Riavvia adesso"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Preferisco riavviarlo manualmente pi� tardi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Esegui $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Mostra il file Readme"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Scelta della cartella del men� Start" 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Scegliere una cartella del men� Start per i collegamenti del programma." 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Scegliere la cartella del men� Start in cui verranno crati i collegamenti del programma. � possibile inserire un nome per creare una nuova cartella."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Non creare i collegamenti al programma."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Se sicuro di voler terminare l'installazione di $(^Name) ?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "Disintalla $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "Rimuove $(^Name) dal computer."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "Selezione componenti"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "Scegliere i componenti di $(^Name) che si desidera disinstallare."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Disinstallazione in corso"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Prego attendere mentre $(^Name) viene disinstallato."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Disinstallazione completata"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "La disinstallazione � stata completata con successo."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Disinstallazione interrotta"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "La disintallazione non e' stata completata correttamente."
  
!insertmacro MUI_LANGUAGEFILE_END
