;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.65

;Language: Serbian (1050)
;Translation by Vladan "vladano@EUnet.yu" Obradovic

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SERBIAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Serbian" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Pritisni Nastavi za nastavak."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Klikni Instaliraj da zapo�ne� instalaciju."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Dobro do�ao u ${MUI_PRODUCT} Instalaciju"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Ovo �e instalirati ${MUI_PRODUCT} na tvoj ra�unar.\r\n\r\nPreporu�ujem da zatvori� sve ostale aplikacije pre zapo�injanja Instalacije. To ce dozvoliti Instalaciji da nadogradi neke sistemska datoteke bez potrebe za ponovnim pokretanjem va�eg ra�unara.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licenca"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Pro�itaj licencu pre instalacije ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Pritisni Page Down da vidi� ostatak licence."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Ako prihvata� uslove licence, odaberi Prihvatam za nastavak. Mora� prihvatiti licencu da instalira� ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ako prihvata� uslove licence, klikni na kvadrati� ispod. Mora� prihvatiti licencu da instalira� ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ako prihvata� uslove licence, odaberi prvu opciju ispod. Mora� prihvatiti licencu da instalira� ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Odaberi komponente"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Odaberi koje komponente ${MUI_PRODUCT} �eli� instalirati."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Uklju�i komponente koje �eli� instalirati i isklju�i one koje ne �eli�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Pro�i mi�em iznad komponente da vidi� njen opis."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Odaberi instalacioni direktorijum"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Odaberi direktorijum u koji �eli� instalirati ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Instalacija �e instalirati ${MUI_PRODUCT} u slede�i direktorijum.$\r$\n$\r$\nAko �eli� instalirati u drugi direktorijum, klikni Tra�i i odaberi ga."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Instalacioni Direktorijum"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instalacija"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Pri�ekaj dok se instalira ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Instalacija zavr�ena"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Instalacija je uspe�no zavr�ena."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Instalacija prekinuta"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Setup nije uspe�no zavr�en."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Zavr�i"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Zavr�avam ${MUI_PRODUCT} Instalaciju"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} je instaliran na tvoj ra�unar.\r\n\r\nKlikni Zavr�i da zatvori� ovaj prozor."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Tvoj ra�unar je potrebno resetovati da zavr�i instalaciju ${MUI_PRODUCT}. �eli� li da ga resetuje� sada?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Resetuj sada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "�elim ga ru�no resetovati kasnije"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Pokreni ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Poka�i Readme"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Odaberi Direktorijum u Start Meniju"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Odaberi direktorijum u Start Meniju za programske shortcutove."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Odaberi direktorijum u Start Meniju u kojem �eli� napraviti programske shortcutove. Mo�e� i uneti ime pa napraviti novi direktorijum."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Nemoj napraviti shortcute"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Jesi li siguran da �eli� iza�i iz ${MUI_PRODUCT} Instalacije?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Pritisni Deinstaliraj da zapo�ne� deinstalaciju."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Deinstaliraj ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Obri�i ${MUI_PRODUCT} sa tvog ra�unara."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Ova aplikacija �e deinstalirati ${MUI_PRODUCT} sa tvog ra�unara."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Deinstaliraj"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Pri�ekaj dok se deinstalira ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Zavr�eno"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Deinstalacija je uspe�no zavr�ena."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Deinstalacija prekinuta"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Deinstalacija nije uspe�no zavr�ena."

!insertmacro MUI_LANGUAGEFILE_END