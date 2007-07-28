;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.68

;Language: Slovak (1051)
;Translated by: Kypec (peter.dzugas@mahe.sk), edited by: Mari�n Hikan�k (podnety@mojepreklady.net)

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "Slovak"

  !define MUI_LANGNAME "Slovensky" ;Use only ASCII characters (if this is not possible, use the English name)

  !define MUI_TEXT_WELCOME_INFO_TITLE "Vitajte v sprievodcovi in�tal�ciou programu $(^NameDA)"
  !define MUI_TEXT_WELCOME_INFO_TEXT "Tento sprievodca V�s prevedie in�tal�ciou $(^NameDA).\r\n\r\nPred za�iatkom in�tal�cie sa odpor��a ukon�i� v�etky ostatn� programy. T�m umo�n�te aktualizovanie syst�mov�ch s�borov bez potreby re�tartovania V�ho po��ta�a.\r\n\r\n$_CLICK"
  
  !define MUI_TEXT_LICENSE_TITLE "Licen�n� zmluva"
  !define MUI_TEXT_LICENSE_SUBTITLE "Pred in�tal�ciou $(^NameDA) si pros�m pre�tudujte licen�n� podmienky."
  !define MUI_INNERTEXT_LICENSE_TOP "Stla�en�m kl�vesy Page Down posuniete text licen�nej zmluvy."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "Ak s�hlas�te s podmienkami zmluvy, kliknite na tla�idlo S�hlas�m a m��ete pokra�ova� v in�tal�ci�. Ak chcete v in�tal�ci� pokra�ova�, mus�te ods�hlasi� podmienky licen�nej zmluvy $(^NameDA)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ak s�hlas�te s podmienkami zmluvy, za�krtnite ni��ie uveden� pol��ko. Ak chcete v in�tal�ci� pokra�ova�, mus�te ods�hlasi� podmienky licen�nej zmluvy $(^NameDA)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ak s�hlas�te s podmienkami zmluvy, ozna�te prv� z ni��ie uveden�ch mo�nost�. Ak chcete v in�tal�ci� pokra�ova�, mus�te ods�hlasi� podmienky licen�nej zmluvy $(^NameDA)."
  
  !define MUI_TEXT_COMPONENTS_TITLE "Vo�ba s��ast� programu"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "Zvo�te si tie s��asti programu $(^NameDA), ktor� chcete nain�talova�."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Popis"
  !ifndef NSIS_CONFIG_COMPONENTPAGE_ALTERNATIVE
    !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Pri prejden� kurzorom my�i nad n�zvom s��asti sa zobraz� jej popis."
  !else
    !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Ozna�te nejak� s��as�, ak chcete zobrazi� jej podrobnej�� popis."
  !endif
  
  !define MUI_TEXT_DIRECTORY_TITLE "Vo�ba umiestnenia programu"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "Vyberte si prie�inok, do ktor�ho chcete nain�talova� program $(^NameDA)."
  
  !define MUI_TEXT_INSTALLING_TITLE "In�tal�cia"
  !define MUI_TEXT_INSTALLING_SUBTITLE "Po�kajte pros�m, k�m prebehne in�tal�cia programu $(^NameDA)."
  
  !define MUI_TEXT_FINISH_TITLE "Ukon�enie in�tal�cie"
  !define MUI_TEXT_FINISH_SUBTITLE "In�tal�cia bola dokon�en� �spe�ne."

  !define MUI_TEXT_ABORT_TITLE "Preru�enie in�tal�cie"
  !define MUI_TEXT_ABORT_SUBTITLE "In�tal�ciu sa nepodarilo dokon�i�."

  !define MUI_BUTTONTEXT_FINISH "&Dokon�i�"
  !define MUI_TEXT_FINISH_INFO_TITLE "Dokon�enie in�tal�cie programu $(^NameDA)"
  !define MUI_TEXT_FINISH_INFO_TEXT "Program $(^NameDA) bol nain�talovan� do V�ho po��ta�a.\r\nKliknite na tla�idlo Dokon�i� a tento sprievodca sa ukon��."
  !define MUI_TEXT_FINISH_INFO_REBOOT "Pre �pln� dokon�enie in�tal�cie programu $(^NameDA) je potrebn� re�tartova� V� po��ta�. Chcete ho re�tartova� ihne�?"
  !define MUI_TEXT_FINISH_REBOOTNOW "Re�tartova� teraz"
  !define MUI_TEXT_FINISH_REBOOTLATER "Re�tartova� nesk�r (manu�lne)"
  !define MUI_TEXT_FINISH_RUN "&Spusti� program $(^NameDA)"
  !define MUI_TEXT_FINISH_SHOWREADME "&Zobrazi� s�bor s inform�ciami"
  
  !define MUI_TEXT_STARTMENU_TITLE "Vo�ba umiestnenia v ponuke �tart"
  !define MUI_TEXT_STARTMENU_SUBTITLE "Vyberte si zlo�ku v ponuke �tart, kam sa umiestnia odkazy na program $(^NameDA)."
  !define MUI_INNERTEXT_STARTMENU_TOP "Vyberte si zlo�ku v ponuke �tart, v ktorej chcete vytvori� odkazy na program. Takisto m��te nap�sa� n�zov pre vytvorenie novej zlo�ky."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "Nevytv�ra� odkazy"
  
  !define MUI_TEXT_ABORTWARNING "Naozaj chcete ukon�i� in�tal�ciu programu $(^Name)?"
  
  
  !define MUI_UNTEXT_WELCOME_INFO_TITLE "Vitajte v sprievodcovi odin�talovan�m programu $(^NameDA)"
  !define MUI_UNTEXT_WELCOME_INFO_TEXT "Tento sprievodca V�s prevedie procesom odin�talovania programu $(^NameDA).\r\n\r\nPred spusten�m procesu odin�talovania sa uistite, �e program $(^NameDA) nie je pr�ve akt�vny.\r\n\r\n$_CLICK"

  !define MUI_UNTEXT_CONFIRM_TITLE "Odin�talovanie programu $(^NameDA)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "Odstr�nenie programu $(^NameDA) z V�ho po��ta�a."
  
  !define MUI_UNTEXT_LICENSE_TITLE "Licen�n� zmluva"  
  !define MUI_UNTEXT_LICENSE_SUBTITLE "Pred odin�talovan�m programu $(^NameDA) si pros�m pre��tajte licen�n� podmienky."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "Ak s�hlas�te s podmienkami zmluvy, zvo�te S�hlas�m. Licen�n� zmluvu mus�te ods�hlasi�, ak chcete v odin�talov�van� programu $(^NameDA) pokra�ova�."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ak s�hlas�te s podmienkami zmluvy, za�krtnite ni��ie uveden� pol��ko. Licen�n� zmluvu mus�te ods�hlasi�, ak chcete pokra�ova� v odin�talov�van� programu $(^NameDA). $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ak s�hlas�te s podmienkami licen�nej zmluvy, ozna�te prv� z ni��ie uveden�ch mo�nost�. Licen�n� zmluvu mus�te ods�hlasi�, ak chcete pokra�ova� v odin�talov�van� programu $(^NameDA). $_CLICK"

  !define MUI_UNTEXT_COMPONENTS_TITLE "Vo�ba s��ast�"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "Zvo�te s��asti programu $(^NameDA), ktor� chcete odin�talova�."
  
  !define MUI_UNTEXT_DIRECTORY_TITLE "Umiestenie programu pre odin�talovanie"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "Vyberte si prie�inok, z ktor�ho chcete odin�talova� program $(^NameDA)."
  
  !define MUI_UNTEXT_UNINSTALLING_TITLE "Odin�talovanie"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "�akajte pros�m, k�m prebehne odin�talovanie programu $(^NameDA)."
    
  !define MUI_UNTEXT_FINISH_TITLE "Ukon�enie odin�talovania"
  !define MUI_UNTEXT_FINISH_SUBTITLE "Odin�talovanie bolo �spe�ne dokon�en�."
  
  !define MUI_UNTEXT_ABORT_TITLE "Preru�enie odin�talovania"
  !define MUI_UNTEXT_ABORT_SUBTITLE "Odin�talovanie sa neukon�ilo �spe�ne."
  
  !define MUI_UNTEXT_FINISH_INFO_TITLE "Dokon�enie sprievodcu odin�talovan�m"
  !define MUI_UNTEXT_FINISH_INFO_TEXT "Program $(^NameDA) bol odin�talovan� z V�ho po��ta�a.\r\n\r\nKliknite na tla�idlo Dokon�i� a tento sprievodca sa ukon��."
  !define MUI_UNTEXT_FINISH_INFO_REBOOT "Pre �pln� dokon�enie odin�talovania programu $(^NameDA) je nutn� re�tartova� V� po��ta�. Chcete ho re�tartova� ihne�?"
  
  !define MUI_UNTEXT_ABORTWARNING "Naozaj chcete ukon�i� proces odin�talovania programu $(^Name)?"
  
!insertmacro MUI_LANGUAGEFILE_END