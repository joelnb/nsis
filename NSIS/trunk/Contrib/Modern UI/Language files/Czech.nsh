;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.65

;Language: Czech (1029)
;By T.V. Zuggy (http://zuggy.wz.cz/)

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "CZECH"

  !define MUI_LANGNAME "Cesky" ;Use only ASCII characters (if this is not possible, use the English name)

  !define MUI_TEXT_WELCOME_INFO_TITLE "V�tejte v pr�vodci instalace programu $(^Name)"
  !define MUI_TEXT_WELCOME_INFO_TEXT "Chyst�te se nainstalovat $(^Name) na sv�j po��ta�.\r\n\r\nP�ed za��tkem instalace je doporu�eno zav��t v�echny ostatn� aplikace. T�mto umo�n�te instal�toru aktualizovat p��padn� syst�mov� soubory bez nutnosti restartovat syst�m.\r\n\r\n$_CLICK"

  !define MUI_TEXT_LICENSE_TITLE "Licen�n� ujedn�n�"
  !define MUI_TEXT_LICENSE_SUBTITLE "P�ed instalac� programu $(^Name), pros�m, prostudujte licen�n� podm�nky."
  !define MUI_INNERTEXT_LICENSE_TOP "Stisknut�m kl�vesy Page Down posunete text licen�n�ho ujedn�n�."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "Jestli�e souhlas�te se v�emi podm�nkami ujedn�n�, zvolte Souhlas�m pro pokra�ov�n�. Je nutn� souhlasit s licen�n�m ujedn�n�m pro instalaci programu $(^Name)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Jestli�e souhlas�te se v�emi podm�nkami ujedn�n�, za�krtn�te n�e uvedenou volbu. Je nutn� souhlasit s licen�n�m ujedn�n�m pro instalaci programu $(^Name)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Jestli�e souhlas�te se v�emi podm�nkami ujedn�n�, zvolte prvn� z mo�nost� uveden�ch n�e. Je nutn� souhlasit s licen�n�m ujedn�n�m pro instalaci programu $(^Name)."

  !define MUI_TEXT_COMPONENTS_TITLE "Volba sou��st�"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "Zvolte sou��sti programu $(^Name), kter� chcete nainstalovat."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Popisek"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "P�i pohybu my�� nad sou��st� programu se zde zobraz� jej� popisek."

  !define MUI_TEXT_DIRECTORY_TITLE "Volba um�st�n� instalace"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "Zvolte adres��, do kter�ho chcete nainstalovat program $(^Name)."

  !define MUI_TEXT_INSTALLING_TITLE "Instalace"
  !define MUI_TEXT_INSTALLING_SUBTITLE "Vy�kejte, pros�m, na dokon�en� instalace programu $(^Name)."

  !define MUI_TEXT_FINISH_TITLE "Dokon�en� instalace"
  !define MUI_TEXT_FINISH_SUBTITLE "Instalace prob�hla v po��dku."

  !define MUI_TEXT_ABORT_TITLE "Instalace p�eru�ena"
  !define MUI_TEXT_ABORT_SUBTITLE "UPOZORN�N�: Instalace nebyla dokon�ena."

  !define MUI_BUTTONTEXT_FINISH "&Dokon�it"
  !define MUI_TEXT_FINISH_INFO_TITLE "Dokon�en� pr�vodce instalace programu $(^Name)"
  !define MUI_TEXT_FINISH_INFO_TEXT "Pr�v� jste nainstalovali program $(^Name) do sv�ho syst�mu.\r\nKlikn�te na Dokon�it pro uzav�en� tohoto pr�vodce."
  !define MUI_TEXT_FINISH_INFO_REBOOT "Pro �pln� dokon�en� instalace programu $(^Name) je nutn� prov�st restart Va�eho syst�mu. Chcete restartovat ihned?"
  !define MUI_TEXT_FINISH_REBOOTNOW "Restartovat ihned"
  !define MUI_TEXT_FINISH_REBOOTLATER "Restartovat ru�n� pozd�ji"
  !define MUI_TEXT_FINISH_RUN "&Spustit $(^Name)"
  !define MUI_TEXT_FINISH_SHOWREADME "&Uk�zat �ti-m�"

  !define MUI_TEXT_STARTMENU_TITLE "Volba um�st�n� v nab�dce Start"
  !define MUI_TEXT_STARTMENU_SUBTITLE "Zvolte polo�ku v nab�dce Start pro um�st�n� z�stupc� programu."
  !define MUI_INNERTEXT_STARTMENU_TOP "Vyberte polo�ku v nab�dce Start, ve kter� chcete vytvo�it z�stupce programu. Pokud zad�te neexistuj�c� polo�ku, bude vytvo�ena nov� s V�mi zadan�m jm�nem."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "Nevytv��et z�stupce"

  !define MUI_TEXT_ABORTWARNING "Opravdu chcete ukon�it instalaci programu $(^Name)?"


  !define MUI_UNTEXT_CONFIRM_TITLE "Odinstalov�n� programu $(^Name)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "Odstran�n� programu $(^Name) z Va�eho syst�mu."

  !define MUI_UNTEXT_UNINSTALLING_TITLE "Odinstalov�n�"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "Vy�kejte, pros�m, na dokon�en� odinstalov�n� programu $(^Name)."

  !define MUI_UNTEXT_FINISH_TITLE "Dokon�en� odinstalace"
  !define MUI_UNTEXT_FINISH_SUBTITLE "Odinstalov�n� prob�hlo v po��dku."

  !define MUI_UNTEXT_ABORT_TITLE "Odinstalov�n� p�eru�eno"
  !define MUI_UNTEXT_ABORT_SUBTITLE "UPOZORN�N�: Odinstalov�n� nebylo dokon�eno."

!insertmacro MUI_LANGUAGEFILE_END