;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.65

;Language: Swedish (1053)
;By Magnus Bonnevier (magnus.bonnevier@telia.com), updated by Rickard Angbratt (r.angbratt@home.se)
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SWEDISH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Svenska" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Klicka N�sta f�r att forts�tta."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Klicka Installera f�r att starta installationen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "V�lkommen till installationsguiden f�r ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Denna guide tar dig igenom installationen av ${MUI_PRODUCT}.\r\n\r\nDet �r rekomenderat att du avslutar alla program innan du forts�tter installationen. Detta till�ter att installationen kan uppdatera vissa systemfiler utan att starta om din dator.\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licensavtal"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Var v�nlig l�s igenom licensvilkoren innan du installerar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Tryck Page Down f�r att se resten av licensavtalet."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Om du accepterar vilkoren i avtalet, klicka Jag Godk�nner f�r att forts�tta. Du m�ste acceptera avtalet f�r att installera ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Om du accepterar vilkoren i avtalet, klicka i checkrutan nedan. Du m�ste acceptera avtalet f�r att installera ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Om du accepterar vilkoren i avtalet, v�lj det f�rsta alternativet nedan. Du m�ste acceptera avtalet f�r att installera ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "V�lj komponenter"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "V�lj vilka alternativ av ${MUI_PRODUCT} som du vill installera."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Checka dom alternativ du vill installera och checka av dom du inte vill installera."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Beskrivning"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "H�ll muspekaren �ver ett alternativ f�r att se dess beskrivning."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "V�lj installationsv�g"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "V�lj katalog att installera ${MUI_PRODUCT} i."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Guiden kommer att installera ${MUI_PRODUCT} i f�ljande katalog.$\r$\n$\r$\nF�r att installera i en annan katalog, klicka p� Bl�ddra och v�lj en annan katalog."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Destinationskatalog"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Installerar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Var v�nlig v�nta medan ${MUI_PRODUCT} installeras."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Installationen �r klar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Guiden avslutades korrekt."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Installationen avbr�ts"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Guiden geonomf�rdes inte korrekt."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Avsluta"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Avslutar installationsguiden f�r ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} har installerats p� din dator.\r\n\r\nKlicka p� Avsluta f�r att avsluta guiden."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Din dator m�ste startas om f�r att fullborda installationen av ${MUI_PRODUCT}. Vill du starta om nu?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Starta om nu"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Jag vill starta om sj�lv senare"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "&K�r ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "&Visa Readme-filen"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "V�lj Startmenykatalog"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "V�lj en Startmenykatalog f�r programmets genv�gar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "V�lj startmenykatalog i vilken du vill skapa programmets genv�gar. Du kan ange ett eget namn f�r att skapa en ny katalog."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Skapa ej genv�gar"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�r du s�ker p� att du vill avbryta installationen av ${MUI_PRODUCT}?"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Klicka p� Avinstallera f�r att starta avinstallationen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Avinstallera ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Ta bort ${MUI_PRODUCT} fr�n din dator."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Denna guide kommer att avinstallera ${MUI_PRODUCT} fr�n din dator."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Avinstallerar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Var v�nlig v�nta medan ${MUI_PRODUCT} avinstalleras."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Avinstallationen genomf�rd"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Avinstallationen genomf�rdes korrekt."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Avinstallationen avbruten"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Avinstallationen genomf�rdes inte korrekt."
  
!insertmacro MUI_LANGUAGEFILE_END