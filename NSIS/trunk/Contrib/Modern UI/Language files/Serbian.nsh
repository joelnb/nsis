;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Serbian (2074)
;Translation by Vladan "vladano@EUnet.yu" Obradovic

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SERBIAN"

  !define MUI_LANGNAME "Serbian" ;Name of the language in the language itself

  !define MUI_TEXT_WELCOME_INFO_TITLE "Dobro do�ao u $(^Name) Instalaciju"
  !define MUI_TEXT_WELCOME_INFO_TEXT "Ovo �e instalirati $(^Name) na tvoj ra�unar.\r\n\r\nPreporu�ujem da zatvori� sve ostale aplikacije pre zapo�injanja Instalacije. To ce dozvoliti Instalaciji da nadogradi neke sistemska datoteke bez potrebe za ponovnim pokretanjem va�eg ra�unara.\r\n\r\n$_CLICK"

  !define MUI_TEXT_LICENSE_TITLE "Licenca"
  !define MUI_TEXT_LICENSE_SUBTITLE "Pro�itaj licencu pre instalacije $(^Name)."
  !define MUI_INNERTEXT_LICENSE_TOP "Pritisni Page Down da vidi� ostatak licence."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "Ako prihvata� uslove licence, odaberi Prihvatam za nastavak. Mora� prihvatiti licencu da instalira� $(^Name)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ako prihvata� uslove licence, klikni na kvadrati� ispod. Mora� prihvatiti licencu da instalira� $(^Name). $_CLICK"
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ako prihvata� uslove licence, odaberi prvu opciju ispod. Mora� prihvatiti licencu da instalira� $(^Name). $_CLICK"

  !define MUI_TEXT_COMPONENTS_TITLE "Odaberi komponente"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "Odaberi koje komponente $(^Name) �eli� instalirati."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Pro�i mi�em iznad komponente da vidi� njen opis."

  !define MUI_TEXT_DIRECTORY_TITLE "Odaberi instalacioni direktorijum"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "Odaberi direktorijum u koji �eli� instalirati $(^Name)."

  !define MUI_TEXT_INSTALLING_TITLE "Instalacija"
  !define MUI_TEXT_INSTALLING_SUBTITLE "Pri�ekaj dok se instalira $(^Name)."

  !define MUI_TEXT_FINISH_TITLE "Instalacija zavr�ena"
  !define MUI_TEXT_FINISH_SUBTITLE "Instalacija je uspe�no zavr�ena."

  !define MUI_TEXT_ABORT_TITLE "Instalacija prekinuta"
  !define MUI_TEXT_ABORT_SUBTITLE "Setup nije uspe�no zavr�en."

  !define MUI_BUTTONTEXT_FINISH "&Zavr�i"
  !define MUI_TEXT_FINISH_INFO_TITLE "Zavr�avam $(^Name) Instalaciju"
  !define MUI_TEXT_FINISH_INFO_TEXT "$(^Name) je instaliran na tvoj ra�unar.\r\n\r\nKlikni Zavr�i da zatvori� ovaj prozor."
  !define MUI_TEXT_FINISH_INFO_REBOOT "Tvoj ra�unar je potrebno resetovati da zavr�i instalaciju $(^Name). �eli� li da ga resetuje� sada?"
  !define MUI_TEXT_FINISH_REBOOTNOW "Resetuj sada"
  !define MUI_TEXT_FINISH_REBOOTLATER "�elim ga ru�no resetovati kasnije"
  !define MUI_TEXT_FINISH_RUN "Pokreni $(^Name)"
  !define MUI_TEXT_FINISH_SHOWREADME "Poka�i Readme"

  !define MUI_TEXT_STARTMENU_TITLE "Odaberi Direktorijum u Start Meniju"
  !define MUI_TEXT_STARTMENU_SUBTITLE "Odaberi direktorijum u Start Meniju za programske shortcutove."
  !define MUI_INNERTEXT_STARTMENU_TOP "Odaberi direktorijum u Start Meniju u kojem �eli� napraviti programske shortcutove. Mo�e� i uneti ime pa napraviti novi direktorijum."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "Nemoj napraviti shortcute"

  !define MUI_TEXT_ABORTWARNING "Jesi li siguran da �eli� iza�i iz $(^Name) Instalacije?"


  !define MUI_UNTEXT_CONFIRM_TITLE "Deinstaliraj $(^Name)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE  "Obri�i $(^Name) sa tvog ra�unara."

  !define MUI_UNTEXT_LICENSE_TITLE "Licenca"  
  !define MUI_UNTEXT_LICENSE_SUBTITLE "Please review the license terms before uninstalling $(^Name)."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to uninstall $(^Name)."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "If you accept the terms of the agreement, click the check box below. You must accept the agreement to uninstall $(^Name). $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "If you accept the terms of the agreement, select the first option below. You must accept the agreement to uninstall $(^Name). $_CLICK"

  !define MUI_UNTEXT_COMPONENTS_TITLE "Choose Components"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "Choose which features of $(^Name) you want to uninstall."

  !define MUI_UNTEXT_DIRECTORY_TITLE "Choose Uninstall Location"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "Choose the folder from which to uninstall $(^Name)."

  !define MUI_UNTEXT_UNINSTALLING_TITLE "Deinstaliraj"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "Pri�ekaj dok se deinstalira $(^Name)."

  !define MUI_UNTEXT_FINISH_TITLE "Zavr�eno"
  !define MUI_UNTEXT_FINISH_SUBTITLE "Deinstalacija je uspe�no zavr�ena."
  
  !define MUI_UNTEXT_ABORT_TITLE "Deinstalacija prekinuta"
  !define MUI_UNTEXT_ABORT_SUBTITLE "Deinstalacija nije uspe�no zavr�ena."

!insertmacro MUI_LANGUAGEFILE_END