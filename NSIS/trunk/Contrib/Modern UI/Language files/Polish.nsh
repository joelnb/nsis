;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4 and Basic Modern UI 1.61 scripts (needs te be updated!)

;Language: Polish (1045)
;By Piotr Murawski & Rafa� Lampe; www.lomsel.prv.pl mailto:ppiter@skrzynka.pl

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "POLISH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Polski" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Umowa licencyjna"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Prosz� przejrzy warunki licencji przed instalacj� ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Prosz� nadu� klawisz Page Down, aby zobaczy� reszt� umowy."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Je�eli akceptujesz wszystkie warunki umnowy wybierz Zgadzam si�, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby zainstalowa� ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Wyb�r komponent�w"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Wybierz komponenty ${MUI_PRODUCT}, kt�re chcesz zainstalowa�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Zaznacz komponenty, kt�re chcesz zainstalowa� oraz odznacz komponenty, kt�re nie maj� by� zainstalowane. Kliknij przycisk Dalej, aby kontynuowa�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Przesu� kursor myszy nad komponent, aby zobaczy� jego opis."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Wyb�r miejsca instalacji"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Wybierz folder, w kt�rym ma by� zainstalowany ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Instalator zainstaluje ${MUI_PRODUCT} do nast�puj�cego folderu.$\r$\n$\r$\nAby zainstalowa� w tym folderze kliknij Instaluj. Aby zainstalowa� w innym folderze kliknij Przegl�daj i wybierz inny folder."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Folder docelowy"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instaluje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Prosz� czeka�, kiedy ${MUI_PRODUCT} jest instalowany."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Zako�czono"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Instalacja zako�czona powodzeniem."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Czy na pewno chcesz wyj�� z instalatora ${MUI_PRODUCT}?"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Odinstaluj ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Usu� ${MUI_PRODUCT} z twojego systemu."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Deinstalator odinstaluje ${MUI_PRODUCT} z twojego systemu."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Odinstalowuje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Prosz� czeka�, kiedy ${MUI_PRODUCT} jest odinstalowywany."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_TITLE "Zako�czono"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_SUBTITLE "Odinstalowanie zako�czone powodzeniem."
    
!insertmacro MUI_LANGUAGEFILE_END