;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.64

;Language: Slovenian (0424)
;By Janez Dolinar

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SLOVENIAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Sloven��ina" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Pritisnite Naprej za nadaljevanje."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Pritisnite Za�ni za za�etek namestitve."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Dobrodo�li v ${MUI_PRODUCT} �arovniku"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Ta program bo na va� ra�unalnik namestil ${MUI_PRODUCT}.\r\n\r\nPriporo�amo vam, da zaprete vsa ostala okna in programe pred namestitvijo. To bo omogo�alo nemoteno namestitev programa in njegovih delov brez ponovnega zagona ra�unalnika.\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licen�na pogodba"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Prosimo, preglejte pogoje pogodbe pred namestitvijo ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Prisnite tipko 'Page Down', za preostali del pogodbe."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "�e se strinjate s pogoji, pritisnite Se strinjam. S pogodbo se morate strinjati, da bi lahko namestili ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "�e se strinjate z pogoji licen�nimi pogoji pogodbe, spodaj obkljukajte primerno okence. Za namestitev ${MUI_PRODUCT} se morate strinjati s pogoji pogodbe."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "�e se strinjate z pogoji licen�nimi pogoji pogodbe, spodaj izberite prvo mo�nost. Za namestitev ${MUI_PRODUCT} se morate strinjati s pogoji pogodbe."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Izberite bloke"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Izberite si, katere bloke izdelka ${MUI_PRODUCT} �elite namestiti."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Obkljukajte bloke, ki jih �elite in odkljukajte tiste, ki jih ne �elite."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Povlecite mi�ko nad blok, da vidite njegov opis."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Izberite si pot namestive"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Izberite si mapo, v katero boste namestili ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Program bo namestil ${MUI_PRODUCT} v slede�o mapo.$\r$\n$\r$\nDa bi mapo spremenili, pritisnite na tipko Browse (Razi��i) in izberite drugo mapo."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Ciljna mapa"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Name��anje poteka"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Prosimo po�akajte, ${MUI_PRODUCT} se name��a."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Namestitev dokon�ana"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Namestitev je bila kon�ana uspe�no."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Namestitev je bila prekinjena"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Namestitev ni bila kon�ana uspe�no."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Kon�aj"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Zaklju�ujem namestitev ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "Paket ${MUI_PRODUCT} je bil name��en na va� ra�unalnik..\r\n\r\nPritisnite na Kon�aj za zaklju�itev programa."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Va� ra�unalnik mora biti ponovno zagnan, da bi se ${MUI_PRODUCT} namestitev lahko dokon�ala. �elite ra�unalnik ponovno zagnati sedaj?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Ponovni zagon"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Ra�unalnik bom ponovno zagnal kasneje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Za�eni ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Prika�i informacije"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Izberite mapo Start menija"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Izberite mapo Start menija, kjer bodo bli�njice do programa."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Izberite mapo Start menija, kjer bi �eleli ustvariti bli�njico do programa. �e vpi�ete poljubno ime, se bo ustvarila mapa s tem imenom."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Ne naredi bli�njice"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Ste prepri�ani, da �elite prekiniti namestitev ${MUI_PRODUCT}?"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Pritisnite Odstrani za za�etek odstranitve programa."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Odstrani ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Odstrani ${MUI_PRODUCT} iz va�ega ra�unalnika."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Ta program bo odstranil paket ${MUI_PRODUCT} iz va�ega ra�unalnika."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Odstranjevanje poteka"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Prosimo po�akajte, dokler se paket ${MUI_PRODUCT} odstranjuje."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Uninstallation Complete"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Uninstall was completed successfully."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Odstranitev je bila prekinjena"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Odstranitev ni bila kon�ana uspe�no."

!insertmacro MUI_LANGUAGEFILE_END
