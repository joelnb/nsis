;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.65

;Language: Catalan (1027)
;By falanko

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "CATALAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Catal�" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Premi Seg�ent per continuar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Premi Instal�lar per iniciar l'instal�laci�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Benvingut a l'Assistent d'Instal�laci� de ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Aquest programa instal�lar� ${MUI_PRODUCT} en el seu ordinador.\r\n\r\nEs recomana tancar tota la resta d'aplicacions abans d'iniciar l'Instal�laci�. Aix� permetr� a l'Instal�laci� actualitzar certs arxius del sistema sense haver de reiniciar el seu ordinador.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Acord de Llic�ncia"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Per favor revisi els termes de la llic�ncia abans d'instal�lar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Premi AvP�g per veure la resta de l'acord."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Si accepta tots els termes de l'acord, premi Accepto per continuar. Ha d'acceptar l'acord per poder instal�lar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Si accepta tots els termes de l'acord, marqui la casella de sota. Ha d'acceptar l'acord per poder instal�lar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Si accepta tots els termes de l'acord, seleccioni la primera opci� de sota. Ha d'acceptar l'acord per poder instal�lar ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Selecci� de components"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Seleccioni quines caracter�stiques de ${MUI_PRODUCT} desitja instal�lar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Marqui els components que desitja instal�lar i desmarqui els components que no desitja instal�lar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Descripci�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Situ� el ratol� al damunt d'un component per veure'n la seva descripci�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Escollir el lloc d'instal�laci�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Esculli la carpeta per instal�lar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "S'instal�lar� ${MUI_PRODUCT} en la seg�ent carpeta.$\r$\n$\r$\nPer instal�lar en una carpeta diferent, premi Examinar y seleccioni un altra carpeta."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Carpeta de dest�"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instal�lant"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Per favor esperi mentre ${MUI_PRODUCT} s'instal�la."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Instal�laci� Completada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "L'instal�laci� s'ha realitzat correctament."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Instal�laci� Anul�lada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "L'instal�laci� no s'ha realitzat correctament."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Finalitzar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Completant l'Assistent d'Instal�laci� de ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} s'ha instal�lat al sistema.\r\n\r\nPremi Finalitzar per tancar aquest assistent."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "El sistema ha de ser reiniciat per a que pugui completar-se l'instal�laci� de ${MUI_PRODUCT}. Desitja reiniciar ara?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Reiniciar ara"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Reiniciar m�s tard manualment"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "Executar ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "Veure LLEGEIXME.TXT"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Escollir Carpeta del Men� d'Inici"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Esculli una Carpeta del Men� d'Inici per als accessos directes del programa."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Seleccioni la carpeta del Men� d'Inici en la que hi vulgui crear els accessos directes del programa. Pot introdu�r un altre nom si vol crear una carpeta nova."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "No crear accessos directes"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Est� segur que desitja sortir de l'instal�laci� de ${MUI_PRODUCT}?"
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Premi Desinstal�lar per efectuar la desinstal�laci�."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Desinstal�lar ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Elimina ${MUI_PRODUCT} del seu sistema."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Aquesta aplicaci� desinstal�lar� ${MUI_PRODUCT} del seu ordinador."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Desinstal�lant"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Per favor esperi mentre ${MUI_PRODUCT} es desinstal�la."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Desinstal�laci� Completada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "La desinstal�laci� s'ha realitzat correctament."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Desinstal�laci� Anul�lada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "La desinstal�laci� no s'ha realitzat correctament."

!insertmacro MUI_LANGUAGEFILE_END