;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.6

;Language: English (1030)
;By Christopher www.terrorscript.dynu.com &Musicmp3box@hotmail.com

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "dansk"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "dansk" ;navnet af selve sproget i sig selv

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "tryk p� N�ste for at fors�tte"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "tryk p� installer for at starte installationen"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "velkommen til ${MUI_PRODUCT} installations guide"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "dette vil installer ${MUI_PRODUCT} p� din computer.\r\n\r\nIt det anbefales at du lukker alle andre programmer f�r du starter installationen. dette vil s�rge for at installationen til at opdater visse filer uden at genstarte din pc.\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licens aftale"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "v�r venlig at kigge p� lisens aftalen f�r de forts�tter  ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "tryk Page Down for at se resten af lisens aftalen."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "hvis du accepterer alt under aftalen, v�lg jeg accepter. du skal acceptere lisens aftalen for at installer ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "v�lg programmer"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "v�lg hvad du vil installer af ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "v�lg de kompunenter du vil installer og fjern de kompunenter du ikke vil installer."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "beskrivelse"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "k�r musen over et kompunent for at se dens beskrivelse."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "v�lg hvor du vil have det installeret"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "v�lg hvor du vil have det installeret ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "installationen vil installer ${MUI_PRODUCT} i f�lgende mappe.$\r$\n$\r$\n for at installer det i en anden mappe, tryk p� gennemse og v�lg en anden mappe."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Destinations mappen"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "installer nu"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "vent venlist mens ${MUI_PRODUCT} bliver installeret."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "installationen fuldf�rt"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "installationen blev fuldf�rt."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_WINDOWTITLE ": alslut"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&f�rdig"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "fuldf?rer ${MUI_PRODUCT} installations guide"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} er blevet installeret p� din pc.\r\ntryk alslut for at lukke guiden."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "din pc skal genstartes for at fuldf�re installationen af ${MUI_PRODUCT}. vil du genstarte nu?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "genstart nu"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "nej jeg vil genstarte senere"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "k�r ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "vis readme"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_WINDOWTITLE ": Start Menu mappe"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "v�lg Start Menu mappe"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "v�lg en start menu mappe til programmet genveje."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "v�lg en start menu mappe til programmet genveje. du kan ogs� skrive et navn for at lave en ny pappe."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "lav ikke genveje"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "er du sikker p� at du vil afstulle ${MUI_PRODUCT} installationen?"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "afinstaller ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "fjerne ${MUI_PRODUCT} fra din pc."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "dette vil fjerne ${MUI_PRODUCT} fra dit pc."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "afinstallerer"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "vent venlist mens ${MUI_PRODUCT} bliver fjernet."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_TITLE "f�rdigt"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_SUBTITLE "fjernelsen var fuldf�rt."
  
!insertmacro MUI_LANGUAGEFILE_END