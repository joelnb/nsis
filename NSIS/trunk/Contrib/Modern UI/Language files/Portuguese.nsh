;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Portuguese (2070)
;By Ramon <ramon@netcabo.pt>

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "PORTUGUESE"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Portugu�s" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "Bem vindo ao Assistente de Instala��o do ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Este assistente ajud�-lo-� durante a instala��o do ${MUI_PRODUCT}.\r\n\r\n� recomendado que feche todas as outras aplica��es antes de iniciar a Instala��o. Isto permitir� que o Instalador actualize ficheiros de sistema sem reiniciar o computador.\r\n\r\n$_CLICK"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Contrato de Licen�a"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Por favor, verifique os termos da licen�a antes de instalar o ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Tecle Page Down para ver o restante da licen�a."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Se aceitar os termos da licen�a, clique em 'Aceito' para continuar. Dever� aceitar o contrato para instalar o ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Se aceitar os termos da licen�a, clique na caixa de sele��o abaixo. Dever� aceitar o contrato para instalar o ${MUI_PRODUCT}. $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Se aceitar os termos da licen�a, selecione a primeira op��o abaixo. Voc� deve aceitar o contrato para instalar o ${MUI_PRODUCT}. $_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Escolha de Componentes"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "Escolha quais as caracter�sticas do ${MUI_PRODUCT} que deseja instalar."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Descri��o"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Passe o ponteiro do rato sobre um componente para ver a sua descri��o."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Escolha do Local da Instala��o"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "Escolha a pasta na qual deseja instalar o ${MUI_PRODUCT}."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Instalando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Por favor, aguarde enquanto o ${MUI_PRODUCT} est� sendo instalado."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Instala��o Completa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "A instala��o foi conclu�da com sucesso."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Instala��o Abortada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "A instala��o n�o foi conclu�da com sucesso."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Terminar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "Concluindo o Assistente de Instala��o do ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} foi instalado no seu computador.\r\n\r\nClique em Terminar para fechar este assistente."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "O seu computador deve ser reiniciado para conclu�r a instala��o do ${MUI_PRODUCT}. Deseja reiniciar agora?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Reiniciar Agora"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Eu quero reiniciar manualmente depois"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "&Executar ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "&Mostrar Leiame"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Escolha uma Pasta do Menu Iniciar"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Escolha uma pasta do Menu Iniciar para os atalhos do programa."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Selecione uma pasta do Menu Iniciar em que deseja criar os atalhos do programa. Voc� pode tamb�m digitar um nome para criar uma nova pasta. "
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "N�o criar atalhos"  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Deseja realmente cancelar a instala��o do ${MUI_PRODUCT}?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "Clique em Desinstalar para come�ar a desinstala��o."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "Desinstalar o ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "Remover o ${MUI_PRODUCT} do seu computador."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "Escolher Componentes"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "Escolha quais as caracter�sticas do ${MUI_PRODUCT} que deseja desinstalar."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Desinstalando"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Por favor, aguarde enquanto o ${MUI_PRODUCT} est� sendo desinstalado."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Desinstala��o Completa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "A desinstala��o foi conclu�da com sucesso."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Desinstala��o Abortada"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "A desinstala��o n�o foi conclu�da com sucesso"

!insertmacro MUI_LANGUAGEFILE_END
