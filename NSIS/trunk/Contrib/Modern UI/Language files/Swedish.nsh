;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.64

;Language: Swedish
;By Magnus Bonnevier.
;e-mail: magnus.bonnevier@telia.com
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SWEDISH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Swedish" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Klicka n�sta f�r att forts�tta."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Klicka Install f�r att starta installationen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "V�lkommen till installations guiden f�r ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Denna guide tar dig igenom installationen av ${MUI_PRODUCT}.\r\n\r\nDet �r Rekomenderat att du avslutar alla program innan du forts�tter installationen. Detta till�ter att installationen kan uppdatera vissa system filer utan att starta om din dator.\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licens Avtal"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Var v�nlig l�s igenom licens vilkoren innan du installerar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Tryck Page Down f�r att se resten av licens avtalet."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Om du accepterar vilkoren i avtalet, klicka jag godk�nner f�r att forts�tta. Du m�ste acceptera avtalet f�r att installera ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Om du accepterar vilkoren i avtalet, klicka i check rutan nedan. Du m�ste acceptera avtalet f�r att installera ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Om du accepterar vilkoren i avtalet, v�lj det f�rsta alternativet nedan. Du m�ste acceptera avtalet f�r att installera ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "V�lj komponenter"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "V�lj vilka alternativ av ${MUI_PRODUCT} som du vill installera."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Checka dom alternativ du vill installera och checka av dom du inte vill installera."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Beskrivning"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "H�ll muspekaren �ver ett alternativ f�r att se dess beskrivning."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "V�lj installations v�g"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "V�lj katalog att installera ${MUI_PRODUCT} till."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Guiden kommer att installera ${MUI_PRODUCT} till f�ljande katalog.$\r$\n$\r$\nF�r att installera i en annan katalog, klicka p� bl�ddra och v�lj en annan katalog."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Destinations Katalog"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Installerar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Var v�nlig v�nta medans ${MUI_PRODUCT} installeras."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Installationen �r klar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Guiden avslutades korrekt."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Installationen avbr�ts"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Guiden geonomf�rdes inte korrekt."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Finish"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Avslutar installations guiden f�r ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} har installerats p� din dator.\r\n\r\nKlicka p� Finsh f�r att avsluta guiden."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Din dator m�ste startas om f�r att fullborda installationen av ${MUI_PRODUCT}. Vill du starta om nu?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Starta om nu"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Jag vill starta om sj�lv senare"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "&K�r ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "&Visa readme"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "V�lj start meny katalog"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "V�lj en start meny katalog f�r programmets genv�gar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "V�lj start meny katalog i vilken du vill skapa programmets genv�gar. Du kan ange ett eget namn f�r att skapa en ny katalog."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Skapa ej genv�gar"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�r du s�ker p� att du vill avbryta installationen av ${MUI_PRODUCT} ?"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Klicka p� Uninstall f�r att starta avinstallationen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Avinstallera ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Ta bort ${MUI_PRODUCT} fr�n din dator."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Denna guide kommer att avinstallera ${MUI_PRODUCT} fr�n din dator."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Avinstallerar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "V�nta medans ${MUI_PRODUCT} avinstalleras."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Avinstallation genomf�rd"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Avinstallationen genomf�rdes korrekt."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Avinstallationen avbruten"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Avinstallationen genomf�rdes inte korrekt."
  
!insertmacro MUI_LANGUAGEFILE_END