;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.65

;Language: Croatian (1050)
;By Igor Ostriz

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "CROATIAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Hrvatski" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Odaberite 'Dalje' za nastavak."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Odaberite 'Instaliraj' za po�etak instalacije."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Dobrodo�li u instalaciju programa ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Ovaj �arbnjak �e Vas provesti kroz instalaciju programa ${MUI_PRODUCT} na Va�e ra�unalo.\r\n\r\nPreporu�amo da zatvorite sve ostale aplikacije prije po�etka instalacije. To �e omogu�iti nadogradnju nekih sistemskih datoteka bez potrebe za ponovnim pokretanjem Va�eg ra�unala.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licen�ni ugovor"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Molim pro�itajte licencu prije instalacije programa ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "'Page Down' za ostatak licence."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Ukoliko prihva�ate uvjete licence, odaberite 'Prihva�am' za nastavak. Morate prihvatiti licencu za instalaciju programa ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ukoliko prihva�ate uvjete licence, ozna�ite kvadrati� ispod. Morate prihvatiti licencu za instalaciju programa ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ukoliko prihva�ate uvjete licence, odaberite prvu opciju ispod. Morate prihvatiti licencu za instalaciju programa ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Izbor komponenti"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Odaberite komponente programa ${MUI_PRODUCT} koje �elite instalirati."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Ozna�ite komponente koje �elite instalirati, uklonite oznaku s ne�eljenih komponenti."  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Prije�ite pokaziva�em iznad komponente za njezin opis."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Odaberite odred�te za instalaciju"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Odaberite mapu u koji �elite instalirati program ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Program ${MUI_PRODUCT} �e biti instaliran u navedenu mapu.$\r$\n$\r$\nUkoliko �elite instalirati u neku drugu mapu, odaberite 'Pregledaj...' i zatim �eljenu mapu."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Mapa za instalaciju"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instaliranje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Molim pri�ekajte na zavr�etak instalacije programa ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Kraj instalacije"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Instalacija je u potpunosti zavr�ila uspje�no."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Instalacija je prekinuta"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Instalacija nije zavr�ila uspje�no."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Kraj"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Dovr�enje instalacije programa ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "Program ${MUI_PRODUCT} je instaliran na Va�e ra�unalo.\r\n\r\nOdaberite 'Kraj' da zavr�etak."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Va�e ra�unalo treba ponovno pokrenuti za zavr�etak instalacije programa ${MUI_PRODUCT}. �elite li to u�initi sada?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Ponovno pokreni ra�unalo sada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Ponovno �u pokrenuti ra�unalo kasnije"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Pokreni program ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Prika�i Readme"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Odaberite mapu u Start meniju"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Odaberite mapu u Start meniju za programske pre�ace."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Odaberite mapu u Start Meniju u kojem �elite napraviti programske pre�ace. Mo�ete i sami upisati ime za stvaranje nove mape."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Nemoj napraviti pre�ace"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Jeste li sigurni da �elite prekinuti instalaciju programa ${MUI_PRODUCT}?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Odaberite 'Ukloni' za po�etak uklanjanja."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Ukloni program ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Ukloni program ${MUI_PRODUCT} sa ovog ra�unala."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Ova aplikacija �e ukloniti program ${MUI_PRODUCT} s Va�eg ra�unala."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Uklanjanje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Molim pri�ekajte na zavr�etak uklanjanja programa ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Zavr�eno"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Uklanjanje je u potpunosti zavr�ilo uspje�no."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Uklanjanje je prekinuto"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Uklanjanje nije zavr�ilo uspje�no."

!insertmacro MUI_LANGUAGEFILE_END