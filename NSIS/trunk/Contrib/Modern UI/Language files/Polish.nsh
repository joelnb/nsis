;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Polish (1045)
;By Piotr Murawski & Rafa� Lampe; www.lomsel.prv.pl mailto:ppiter@skrzynka.pl
;Updates and correction since 2.0 a7 by cube cube(at)lp.net.pl
;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "POLISH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Polski" ;Name of the language in the language itself
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Witamy w kreatorze instalacji programu $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Ten kreator pomo�e Ci zainstalowa� program $(^Name).\r\n\r\nZalecamy, by� zamkn�� wszystkie uruchomione programy zanim rozpoczniesz instalacj�. To pozwoli na uaktualnienie niezb�dnych plik�w systemowych bez konieczno�ci ponownego uruchomienia komputera.\r\n\r\n"
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Umowa licencyjna"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Przed instalacj� programu $(^Name) zapoznaj si� z warunkami licencji."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Naci�nij klawisz Page Down, aby zobaczy� reszt� umowy."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Je�eli akceptujesz warunki umowy, wybierz Zgadzam si�, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby zainstalowa� $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Je�eli akceptujesz warunki umowy, zaznacz pole poni�ej, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby zainstalowa� $(^Name).  $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Je�eli akceptujesz warunki umowy, wybierz pierwsz� opcj� poni�ej, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby zainstalowa� $(^Name).  $_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Wyb�r komponent�w"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Wybierz komponenty programu $(^Name), kt�re chcesz zainstalowa�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Opis"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Przesu� kursor myszy nad komponent, aby zobaczy� jego opis."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Wyb�r miejsca instalacji"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Wybierz folder, w kt�rym ma by� zainstalowany $(^Name)."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instaluje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Prosz� czeka�, kiedy $(^Name) jest instalowany."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Zako�czono"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Instalacja zako�czona powodzeniem." 
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Instalacja przerwana"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Instalacja nie zosta�a zako�czona pomy�lnie."
   
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Koniec"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Ko�czenie pracy kreatora instalacji $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "$(^Name) zosta� pomy�lnie zainstalowany na Twoim komputerze.\r\n\r\nKliknij Koniec aby zamkn�� kreatora."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "Tw�j komputer musi zosta� ponownie uruchomiony aby zako�czy� instalacj� programu $(^Name). Czy chcesz zrobi� to teraz?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Uruchom ponownie teraz"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "P�niej sam uruchomi� komputer ponownie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Uruchom program $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Poka� plik czytajto"  
 
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Wybierz folder w menu Start"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Wybierz folder menu Start w kt�rym zostan� umieszczone skr�ty do programu"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Wybierz folder w menu Start w kt�rym chcia�by� umie�ci� skr�ty do programu. Mo�esz tak�e utworzy� nowy folder wpisuj�c jego nazw�."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Nie tw�rz skr�t�w"
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Czy na pewno chcesz wyj�� z instalatora $(^Name)?"

    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "Odinstaluj $(^Name)"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "Usu� $(^Name) z twojego systemu."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "Umowa licencyjna."  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "Przed deinstalacj� programu $(^Name) zapoznaj si� z warunkami licencji."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "Je�eli akceptujesz warunki umowy, wybierz Zgadzam si�, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby odinstalowa� $(^Name)."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "Je�eli akceptujesz warunki umowy, zaznacz pole poni�ej, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby odinstalowa� $(^Name). $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Je�eli akceptujesz warunki umowy, wybierz pierwsz� opcj� poni�ej, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby odinstalowa� $(^Name). $_CLICK"
      
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "Wybierz komponenty"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "Wybierz, kt�re elementy $(^Name) chcesz odinstalowa�."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_TITLE "Wyb�r miejsca deinstalacji"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_SUBTITLE "Wybierz folder, z kt�rego chcesz odinstalowa� $(^Name)."  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Odinstalowuje"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Prosz� czeka�, $(^Name) jest odinstalowywany."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Zako�czono odinstalowanie"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Odinstalowanie zako�czone pomy�lnie."
   
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Odinstalowanie przerwane"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Odinstalowanie nie zosta�o zako�czone pomy�lnie."
     
!insertmacro MUI_LANGUAGEFILE_END