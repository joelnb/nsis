;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.5

;Language: 'Portuguese (Brasil)' (1046)
;By Layout do Brasil www.layoutdobrasil.com

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "PORTUGUESEBR"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Portuguese (Brasil)" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Contrato de Licen�a"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Favor verificar os termos da licen�a antes de instalar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Pressione Page Down para ver o restante da licen�a."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Se voc� aceitar todos os termos da licen�a, escolha Concordo para continuar. Voc� deve aceitar o contrato para instalar ${MUI_PRODUCT}."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Escolhendo Componentes"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Escolha as caracter�sticas do ${MUI_PRODUCT} que voc� deseja instalar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Marque os componentes que voc� deseja instalar e desmarque os componentes que voc� n�o deseja instalar. Clique em Avan�ar para continuar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Descri��o"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Repouse o ponteiro do mouse em cima de um componente para ver sua descri��o."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Escolhendo o Local da Instala��o"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Escolha a pasta na qual deseja instalar ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "O instalador instalar� o ${MUI_PRODUCT} na pasta abaixo.$\r$\n$\r$\nPara prosseguir e instalar nesta pasta, clique em Instalar. Para instalar em uma pasta diferente, clique Procurar... e selecione outra pasta."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Pasta de destino"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instalando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Por favor, aguarde enquanto ${MUI_PRODUCT} est� sendo instalado."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Finalizando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "A instala��o foi finalizada com sucesso."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Voc� deseja realmente finalizar a instala��o ${MUI_PRODUCT}?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Desinstalar ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Remover ${MUI_PRODUCT} de seu sistema."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Isto desinstalar� ${MUI_PRODUCT} de seu sistema."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Desinstalando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Por favor, aguarde enquanto ${MUI_PRODUCT} est� sendo desinstalado."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_TITLE "Finalizando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_SUBTITLE "A desinstala��o foi finalizada com sucesso."

!insertmacro MUI_LANGUAGEFILE_END