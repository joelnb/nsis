;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Croatian (1050)
;By Igor Ostriz

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "CROATIAN"

  !define MUI_LANGNAME "Hrvatski" ;Use only ASCII characters (if this is not possible, use the English name)

  !define MUI_TEXT_WELCOME_INFO_TITLE "Dobrodo�li u instalaciju programa $(^Name)"
  !define MUI_TEXT_WELCOME_INFO_TEXT "Ovaj �arbnjak �e Vas provesti kroz instalaciju programa $(^Name) na Va�e ra�unalo.\r\n\r\nPreporu�amo da zatvorite sve ostale aplikacije prije po�etka instalacije. To �e omogu�iti nadogradnju nekih sistemskih datoteka bez potrebe za ponovnim pokretanjem Va�eg ra�unala.\r\n\r\n$_CLICK"

  !define MUI_TEXT_LICENSE_TITLE "Licen�ni ugovor"
  !define MUI_TEXT_LICENSE_SUBTITLE "Molim pro�itajte licencu prije instalacije programa $(^Name)."
  !define MUI_INNERTEXT_LICENSE_TOP "'Page Down' za ostatak licence."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "Ukoliko prihva�ate uvjete licence, odaberite 'Prihva�am' za nastavak. Morate prihvatiti licencu za instalaciju programa $(^Name)."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ukoliko prihva�ate uvjete licence, ozna�ite ispod kvadrati�. Morate prihvatiti licencu za instalaciju programa $(^Name). $_CLICK"
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ukoliko prihva�ate uvjete licence, odaberite ispod prvu opciju. Morate prihvatiti licencu za instalaciju programa $(^Name). $_CLICK"
  
  !define MUI_TEXT_COMPONENTS_TITLE "Izbor komponenti"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "Odaberite komponente programa $(^Name) koje �elite instalirati."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Prije�ite pokaziva�em iznad komponente za njezin opis."

  !define MUI_TEXT_DIRECTORY_TITLE "Odaberite odredi�te za instalaciju"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "Odaberite mapu u koji �elite instalirati program $(^Name)."

  !define MUI_TEXT_INSTALLING_TITLE "Instaliranje"
  !define MUI_TEXT_INSTALLING_SUBTITLE "Molim pri�ekajte na zavr�etak instalacije programa $(^Name)."

  !define MUI_TEXT_FINISH_TITLE "Kraj instalacije"
  !define MUI_TEXT_FINISH_SUBTITLE "Instalacija je u potpunosti zavr�ila uspje�no."

  !define MUI_TEXT_ABORT_TITLE "Instalacija je prekinuta"
  !define MUI_TEXT_ABORT_SUBTITLE "Instalacija nije zavr�ila uspje�no."

  !define MUI_BUTTONTEXT_FINISH "&Kraj"
  !define MUI_TEXT_FINISH_INFO_TITLE "Dovr�enje instalacije programa $(^Name)"
  !define MUI_TEXT_FINISH_INFO_TEXT "Program $(^Name) je instaliran na Va�e ra�unalo.\r\n\r\nOdaberite 'Kraj' za zavr�etak."
  !define MUI_TEXT_FINISH_INFO_REBOOT "Va�e ra�unalo treba ponovno pokrenuti za zavr�etak instalacije programa $(^Name). �elite li to u�initi sada?"
  !define MUI_TEXT_FINISH_REBOOTNOW "Ponovno pokreni ra�unalo sada"
  !define MUI_TEXT_FINISH_REBOOTLATER "Ponovno �u pokrenuti ra�unalo kasnije"
  !define MUI_TEXT_FINISH_RUN "&Pokreni program $(^Name)"
  !define MUI_TEXT_FINISH_SHOWREADME "Prika�i &Readme"

  !define MUI_TEXT_STARTMENU_TITLE "Odaberite mapu u Start meniju"
  !define MUI_TEXT_STARTMENU_SUBTITLE "Odaberite mapu u Start meniju za programske pre�ace."
  !define MUI_INNERTEXT_STARTMENU_TOP "Odaberite mapu u Start Meniju u kojem �elite napraviti programske pre�ace. Mo�ete i upisati ime za stvaranje nove mape."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "Nemoj napraviti pre�ace"

  !define MUI_TEXT_ABORTWARNING "Jeste li sigurni da �elite prekinuti instalaciju programa $(^Name)?"


  !define MUI_UNTEXT_CONFIRM_TITLE "Uklanjanje programa $(^Name)"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "Program $(^Name) �e biti uklonjen s ovog ra�unala."

  !define MUI_UNTEXT_LICENSE_TITLE "Licen�ni ugovor"  
  !define MUI_UNTEXT_LICENSE_SUBTITLE "Molim pro�itajte licencu prije uklanjanja programa $(^Name)."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "Ukoliko prihva�ate uvjete licence, odaberite 'Prihva�am' za nastavak. Morate prihvatiti licencu za uklanjanje programa $(^Name)."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "Ukoliko prihva�ate uvjete licence, ozna�ite kvadrati� ispod. Morate prihvatiti licencu za uklanjanje programa $(^Name). $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Ukoliko prihva�ate uvjete licence, odaberite prvu opciju ispod. Morate prihvatiti licencu za uklanjanje programa $(^Name). $_CLICK"

  !define MUI_UNTEXT_COMPONENTS_TITLE "Izbor komponenti"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "Odaberite koje komponente programa $(^Name) �elite ukloniti."
  
  !define MUI_UNTEXT_DIRECTORY_TITLE "Odaberite polazi�te za uklanjanje"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "Odaberite mapu iz koje �elite ukloniti program $(^Name)."
  
  !define MUI_UNTEXT_UNINSTALLING_TITLE "Uklanjanje"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "Molim pri�ekajte na zavr�etak uklanjanja programa $(^Name)."

  !define MUI_UNTEXT_FINISH_TITLE "Zavr�eno"
  !define MUI_UNTEXT_FINISH_SUBTITLE "Uklanjanje je u potpunosti zavr�ilo uspje�no."
  
  !define MUI_UNTEXT_ABORT_TITLE "Uklanjanje je prekinuto"
  !define MUI_UNTEXT_ABORT_SUBTITLE "Uklanjanje nije zavr�ilo uspje�no."

!insertmacro MUI_LANGUAGEFILE_END