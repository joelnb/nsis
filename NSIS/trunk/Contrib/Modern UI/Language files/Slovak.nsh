;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Slovak (1051)
;By Kypec (peter.dzugas@mahe.sk)

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SLOVAK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Slovensky" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Vitajte v sprievodcovi in�tal�cie programu $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Chyst�te sa nain�talova� $(^Name) na svoj po��ta�.\r\n\r\nPred za�iatkom in�tal�cie je odpor��an� zavrie� v�etky ostatn� aplik�cie. T�mto umo�n�te in�tal�toru aktualizova� pr�padn� syst�mov� s�bory bez nutnosti re�tartova� syst�m.\r\n\r\n$_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licen�n� zmluva"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Pred in�tal�ciou programu $(^Name) si pros�m pre�tudujte licen�n� podmienky."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Stla�en�m kl�vesy Page Down posuniete text licen�nej zmluvy."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Ak s�hlas�te s podmienkami zmluvy, zvo�te S�hlas�m pre pokra�ovanie. Je nutn� s�hlasi� s licen�nou zmluvou, ak chcete pokra�ova� v in�tal�cii $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ak s�hlas�te s podmienkami zmluvy, za�krtnite ni��ie uveden� pol��ko. Je nutn� s�hlasi� s licen�nou zmluvou, ak chcete pokra�ova� v in�tal�cii $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ak s�hlas�te s podmienkami zmluvy, ozna�te prv� z ni��ie uveden�ch mo�nost�. Je nutn� s�hlasi� s licen�nou zmluvou, ak chcete pokra�ova� v in�tal�cii $(^Name)."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Vo�ba komponentov"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Zvo�te komponenty programu $(^Name), ktor� chcete nain�talova�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Popis"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Pri pohybe my�ou nad komponentom programu sa tu zobraz� jeho popis."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Vo�ba umiestnenia in�tal�cie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Zvo�te adres�r, do ktor�ho chcete nain�talova� program $(^Name)."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "In�tal�cia"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Po�kajte, pros�m, na dokon�enie in�tal�cie programu $(^Name)."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Dokon�enie in�tal�cie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "In�tal�cia prebehla v poriadku."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "In�tal�cia bola preru�en�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "In�tal�cia nebola �spe�ne dokon�en�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Dokon�i�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Dokon�enie sprievodcu in�tal�cie programu $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "Pr�ve ste nain�talovali program $(^Name) do svojho syst�mu.\r\nKliknite na Dokon�i� pre uzavretie tohto sprievodcu."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Pre �pln� dokon�enie in�tal�cie programu $(^Name) je nutn� vykona� re�tart V�ho syst�mu. Chcete re�tartova� ihne�?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Re�tartova� ihne�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Re�tartova� ru�ne nesk�r"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "&Spusti $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "&Uk� ��taj-ma"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Vo�ba umiestnenia v ponuke �tart"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Zvo�te polo�ku v ponuke �tart pre umiestnenie z�stupcov programu."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Vyberte polo�ku v ponuke �tart, v ktorej chcete vytvori� z�stupcov programu. Pokia� zad�te neexistuj�cu polo�ku, bude vytvoren� nov� s Vami zadan�m menom."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Nevytv�ra� z�stupcov"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Naozaj chcete ukon�i� in�tal�ciu programu $(^Name)?"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "Odin�talovanie programu $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "Odstr�nenie programu $(^Name) z V�ho syst�mu."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "Vo�ba komponentov"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "Zvo�te komponenty programu $(^Name), ktor� chcete odin�talova�."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Odin�talovanie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Po�kajte, pros�m, na dokon�enie odin�talovania programu $(^Name)."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Dokon�en�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Odin�talovanie prebehlo v poriadku."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Odin�tal�cia bola preru�en�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Odin�tal�cia nebola �spe�ne dokon�en�."
  
!insertmacro MUI_LANGUAGEFILE_END