;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.4

;Language: 'Portuguese (Brasil)' (1046)
;By Layout do Brasil www.layoutdobrasil.com

;--------------------------------
!verbose 3

!ifndef MUI_PORTUGUESEBR_USED

!define MUI_PORTUGUESEBR_USED

  !define MUI_PORTUGUESEBR_LANGNAME "Portuguese (Brasil)" ;Name of the language in the language itself (English, Deutsch, Fran�ais etc.)

  ;INSTALLER
  
  !ifdef MUI_LICENSEPAGE
     LicenseText /LANG=${LANG_PORTUGUESEBR} "Pressione Page Down para ver o restante da licen�a."
     LangString MUI_TEXT_LICENSE_TITLE ${LANG_PORTUGUESEBR} "Contrato de Licen�a"  
     LangString MUI_TEXT_LICENSE_SUBTITLE ${LANG_PORTUGUESEBR} "Favor verificar os termos da licen�a antes de instalar ${NAME}."
     LangString MUI_INNERTEXT_LICENSE ${LANG_PORTUGUESEBR} "Se voc� aceitar todos os termos da licen�a, escolha Concordo para continuar. Voc� deve aceitar o contrato para instalar ${NAME}."
  !endif
  
  !ifdef MUI_COMPONENTSPAGE
    ComponentText /LANG=${LANG_PORTUGUESEBR} "Marque os componentes que voc� deseja instalar e desmarque os componentes que voc� n�o deseja instalar. Clique em Avan�ar para continuar."
    LangString MUI_TEXT_COMPONENTS_TITLE ${LANG_PORTUGUESEBR} "Escolhendo Componentes"
    LangString MUI_TEXT_COMPONENTS_SUBTITLE ${LANG_PORTUGUESEBR} "Escolha as caracter�sticas do ${NAME} que voc� deseja instalar."
    LangString MUI_INNERTEXT_DESCRIPTION_TITLE ${LANG_PORTUGUESEBR} "Descri��o"
    LangString MUI_INNERTEXT_DESCRIPTION_INFO ${LANG_PORTUGUESEBR} "Repouse o ponteiro do mouse em cima de um componente para ver sua descri��o."
  !endif
  
  !ifdef MUI_DIRECTORYPAGE
    DirText /LANG=${LANG_PORTUGUESEBR} "O instalador instalar� o ${NAME} na pasta abaixo.$\r$\n$\r$\nPara prosseguir e instalar nesta pasta, clique em Instalar. Para instalar em uma pasta diferente, clique Procurar... e selecione outra pasta."
    LangString MUI_TEXT_DIRSELECT_TITLE ${LANG_PORTUGUESEBR} "Escolhendo o Local da Instala��o"
    LangString MUI_TEXT_DIRSELECT_SUBTITLE ${LANG_PORTUGUESEBR} "Escolha a pasta na qual deseja instalar ${NAME}."
    LangString MUI_INNERTEXT_DESTINATIONFOLDER ${LANG_PORTUGUESEBR} "Pasta de destino"
  !endif

  LangString MUI_TEXT_INSTALLING_TITLE ${LANG_PORTUGUESEBR} "Instalando"
  LangString MUI_TEXT_INSTALLING_SUBTITLE ${LANG_PORTUGUESEBR} "Por favor, aguarde enquanto ${NAME} est� sendo instalado."
  
  LangString MUI_TEXT_FINISHED_TITLE ${LANG_PORTUGUESEBR} "Finalizando"
  LangString MUI_TEXT_FINISHED_SUBTITLE ${LANG_PORTUGUESEBR} "A instala��o foi finalizada com sucesso."
  
  !ifdef MUI_ABORTWARNING
    LangString MUI_TEXT_ABORTWARNING ${LANG_PORTUGUESEBR} "Voc� deseja realmente finalizar a instala��o ${NAME}?"
  !endif
  
  !ifdef MUI_INSTALLOPTIONS
    LangString MUI_TEXT_SETUPCAPTION ${LANG_PORTUGUESEBR} "Instala��o de ${NAME} ${VERSION}"
  !endif


  ;UNINSTALLER
  
  !ifdef MUI_UNINSTALLER
    UninstallText /LANG=${LANG_PORTUGUESEBR} "Isto desinstalar� ${NAME} de seu sistema."
    LangString un.MUI_UNTEXT_INTRO_TITLE ${LANG_PORTUGUESEBR} "Desinstalar ${NAME}"
    LangString un.MUI_UNTEXT_INTRO_SUBTITLE ${LANG_PORTUGUESEBR} "Remover ${NAME} de seu sistema."
  
    LangString un.MUI_UNTEXT_UNINSTALLING_TITLE ${LANG_PORTUGUESEBR} "Desinstalando"
    LangString un.MUI_UNTEXT_UNINSTALLING_SUBTITLE ${LANG_PORTUGUESEBR} "Por favor, aguarde enquanto ${NAME} est� sendo desinstalado."
  
    LangString un.MUI_UNTEXT_FINISHED_TITLE ${LANG_PORTUGUESEBR} "Finalizando"
    LangString un.MUI_UNTEXT_FINISHED_SUBTITLE ${LANG_PORTUGUESEBR} "A desinstala��o foi finalizada com sucesso."
  !endif
  
  !ifdef MUI_UNINSTALLOPTIONS
    LangString un.MUI_UNTEXT_SETUPCAPTION ${LANG_PORTUGUESEBR} "Instala��o de ${NAME} ${VERSION}"
  !endif

!endif

!verbose 4