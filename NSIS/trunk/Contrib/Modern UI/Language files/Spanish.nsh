;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.5

;Language: Spanish (1034)
;By MoNKi

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "SPANISH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Espa�ol" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Presione Siguiente para continuar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Presione Instalar para iniciar la instalaci�n."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Acuerdo de licencia"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Por favor revise los t�rminos de la licencia antes de instalar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Presione Avanzar P�gina para ver el resto del acuerdo."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Si acepta todos los t�rminos del acuerdo, seleccione Acepto para continuar. Debe aceptar el acuerdo para instalar ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Selecci�n de componentes"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Seleccione que caracter�sticas de ${MUI_PRODUCT} desea instalar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS "Marque los componentes que desea instalar y desmarque los componentes que no desea instalar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Descripci�n"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Situe el rat�n encima de un componente para ver su descripci�n."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Elegir lugar de instalaci�n"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Elija el directorio en el que instalar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "Se instalar� ${MUI_PRODUCT} en el siguiente directorio.$\r$\n$\r$\nPara instalar en un directorio distinto, presione Examinar y seleccione otro directorio."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Directorio de destino"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instalando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Por favor espere mientas ${MUI_PRODUCT} se instala."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISHED_TITLE "Completado"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISHED_SUBTITLE "La instalaci�n se ha completado correctamente."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_WINDOWTITLE "Carpeta del Men� Inicio"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Elegir Carpeta del Men� Inicio"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Elija una Carpeta del Men� Inicio para los accesos directos del programa."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU "Seleccione una carpeta del Men� Inicio en la que quiera crear los accesos directos del programa. Tambi�n puede introducir un nombre para crear una nueva carpeta."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "�Est� seguro de que desea salir de la instalaci�n de ${MUI_PRODUCT}?"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WINDOWTITLE "Instalaci�n de ${MUI_NAME}"

  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Desinstalar ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Elimina ${MUI_PRODUCT} de su sistema."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Esto desinstalar� ${MUI_PRODUCT} de su sistema."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Desinstalando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Por favor espere mientras ${MUI_PRODUCT} se desinstala."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_TITLE "Completado"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_SUBTITLE "La desinstalaci�n se ha completado correctamente."
   
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_WINDOWTITLE "Desinstalaci�n de ${MUI_NAME}"
    
!insertmacro MUI_LANGUAGEFILE_END