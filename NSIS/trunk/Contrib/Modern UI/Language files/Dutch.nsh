;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Dutch (1043)
;By Joost Verburg

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "DUTCH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Nederlands" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Welkom bij de ${MUI_PRODUCT} Setup Wizard"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Deze wizard zal ${MUI_PRODUCT} op uw systeem installeren.\r\n\r\nHet is aanbevolen dat u alle andere programma's afsluit voordat u Setup start. Dit zorgt ervoor dat Setup bepaalde systeembestanden kan bijwerken zonder uw system opniew op te starten.\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licentie Overeenkomst"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Lees de licentie overeenkomst voordat u ${MUI_PRODUCT} installeert."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Druk op Page Down om de rest van de overeenkomst te zien."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Klik op Akkoord op verder te gaan als u de overeenkomst accepteert. U moet de overeenkomst accepteren om ${MUI_PRODUCT} te installeren."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Klik op het keuzevak hieronder als u de overeenkomst accepteert. U moet de overeenkomst accepteren om ${MUI_PRODUCT} te installeren."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Selecteer de eerste optie hieronder als u de overeenkomst accepteert. U moet de overeenkomst accepteren om ${MUI_PRODUCT} te installeren."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Kies Onderdelen"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Kies de onderdelen die u wilt installeren."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Beschrijving"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Beweeg uw muis over een onderdeel om een beschrijving te zien."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Kies Installatie Locatie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Kies de map waarin u ${MUI_PRODUCT} in wilt installeren."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Bezig met installeren"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Een ogenblik geduld a.u.b. terwijl ${MUI_PRODUCT} wordt geinstalleerd."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Installatie Voltooid"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "De installatie is succesvol verlopen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Installatie Afgebroken"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "De installatie is niet voltooid."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Voltooien"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Voltooien van de ${MUI_PRODUCT} Setup Wizard"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} is geinstalleerd op uw systeem.\r\n\r\nKlik op Voltooien om deze wizard te sluiten."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Uw system moet worden opnieuw opgestart om de installatie van ${MUI_PRODUCT} te voltooien. Wilt u nu herstarten?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Nu herstarten"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Ik wil later handmatig herstarten"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Start ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Leesmij weergeven"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Kies Start Menu Map"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Kies een map in het Startmenu voor de snelkoppelingen van ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Kies een map in het Start Menu waarin de snelkoppelingen moeten worden aangemaakt. U kunt ook een naam invoeren om een niewe map te maken."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Geen snelkoppelingen aanmaken"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Weet u zeker dat u ${MUI_PRODUCT} Setup wilt afsluiten?"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Klik op Verwijder om het verwijderen te starten."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "Verwijder ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "Verwijder ${MUI_PRODUCT} van uw system."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Deze wizard zal ${MUI_PRODUCT} verwijderen van uw systeem."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "Licentie Overeenkomst"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "Lees de licentie overeenkomst voordat u ${MUI_PRODUCT} verwijdert."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "Klik op Akkoord op verder te gaan als u de overeenkomst accepteert. U moet de overeenkomst accepteren om ${MUI_PRODUCT} te verwijderen."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "Klik op het keuzevak hieronder als u de overeenkomst accepteert. U moet de overeenkomst accepteren om ${MUI_PRODUCT} te verwijderen."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Selecteer de eerste optie hieronder als u de overeenkomst accepteert. U moet de overeenkomst accepteren om ${MUI_PRODUCT} te verwijderen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Kies Onderdelen"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Kies de onderdelen die u wilt verwijderen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Kies De�nstallatie Locatie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Kies de map waaruit u ${MUI_PRODUCT} in wilt verwijderen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Bezig met verwijderen"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Een ogenblik geduld a.u.b. terwijl ${MUI_PRODUCT} van uw systeem wordt verwijderd."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Verwijderen Gereed"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "${MUI_PRODUCT} is verwijderd van uw systeem."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Verwijderen Afgebroken"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "${MUI_PRODUCT} is niet volledig verwijderd van uw systeem."
  
!insertmacro MUI_LANGUAGEFILE_END