;Modern UI Language File
;version 1 - Compatible with Modern UI 1.3

;Language: Polish (1045)
;By Piotr Murawski & Rafa� Lampe; www.lomsel.prv.pl mailto:ppiter@skrzynka.pl

;--------------------------------

!ifndef MUI_POLISH_USED

!define MUI_POLISH_USED

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
    LicenseText /LANG=${LANG_POLISH} "Prosz� nadu� klawisz Page Down, aby zobaczy� reszt� umowy."
    LangString MUI_TEXT_LICENSE_TITLE ${LANG_POLISH} "Umowa licencyjna"  
    LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_POLISH} "Prosz� przejrzy warunki licencji przed instalacj� ${NAME}."
    LangString MUI_INNERTEXT_LICENSE ${LANG_POLISH} "Je�eli akceptujesz wszystkie warunki umnowy wybierz Zgadzam si�, aby kontynuowa�. Musisz zaakceptowa� warunki umowy, aby zainstalowa� ${NAME}."
  !endif
  
  !ifdef MUI_COMPONENTPAGE
    ComponentText /LANG=${LANG_POLISH} "Zaznacz komponenty, kt�re chcesz zainstalowa� oraz odznacz komponenty, kt�re nie maj� by� zainstalowane. Kliknij przycisk Dalej, aby kontynuowa�."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_POLISH} "Wyb�r komponent�w"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_POLISH} "Wybierz komponenty ${NAME}, kt�re chcesz zainstalowa�."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_POLISH} "Opis"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_POLISH} "Przesu� kursor myszy nad komponent, aby zobaczy� jego opis."
  !endif
  
  !ifdef MUI_DIRSELECTPAGE
    DirText /LANG=${LANG_POLISH} "Instalator zainstaluje ${NAME} do nast�puj�cego folderu.$\r$\n$\r$\nAby zainstalowa� w tym folderze kliknij Instaluj. Aby zainstalowa� w innym folderze kliknij Przegl�daj i wybierz inny folder." " "
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_POLISH} "Wyb�r miejsca instalacji"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_POLISH} "Wybierz folder, w kt�rym ma by� zainstalowany ${NAME}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_POLISH} "Folder docelowy"
  !endif
  
  !ifdef MUI_INSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_POLISH} "Dalej >"
  !endif
  
  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_POLISH} "Instaluje"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_POLISH} "Prosz� czeka�, kiedy ${NAME} jest instalowany."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_POLISH} "Zako�czono"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_POLISH} "Instalacja zako�czona powodzeniem."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_MSGTEXT_ABORTWARNING ${LANG_POLISH} "Czy na pewno chcesz wyj�� z instalatora ${NAME}?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_BUTTONTEXT_BACK ${LANG_POLISH} "< Cofnij"
    LangString MUI_BUTTONTEXT_NEXT ${LANG_POLISH} "Dalej >"
    LangString MUI_BUTTONTEXT_CANCEL ${LANG_POLISH} "Anuluj"
    LangString MUI_BUTTONTEXT_INSTALL ${LANG_POLISH} "Instaluj"
  !endif
  
  
  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_POLISH} "Deinstalator odinstaluje ${NAME} z twojego systemu."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_POLISH} "Odinstaluj ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_POLISH} "Usu� ${NAME} z twojego systemu."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_POLISH} "Odinstalowuje"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_POLISH} "Prosz� czeka�, kiedy ${NAME} jest odinstalowywany."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_POLISH} "Zako�czono"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_POLISH} "Odinstalowanie zako�czone powodzeniem."
  !endif
  
  !ifdef MUI_UNINSTALLBUTTONTEXT_NEXT
    InstallButtonText /LANG=${LANG_POLISH} "Dalej >"
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS 
    LangString un.MUI_BUTTONTEXT_BACK ${LANG_POLISH} "< Cofnij"
    LangString un.MUI_BUTTONTEXT_NEXT ${LANG_POLISH} "Dalej >"
    LangString un.MUI_BUTTONTEXT_CANCEL ${LANG_POLISH} "Anuluj"
    LangString un.MUI_BUTTONTEXT_UNINSTALL ${LANG_POLISH} "Odinstaluj"
  !endif
    
!endif