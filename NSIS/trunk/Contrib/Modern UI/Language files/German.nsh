;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.5

;Language: German (1031)
;By L.King

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "GERMAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Deutsch" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Lizenzabkommen"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "Bitte lesen Sie die Lizenzbedingungen durch, bevor Sie mit der Installation fortfahren."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "Dr�cken Sie die Bild-nach-unten Taste um den Rest des Abkommens zu sehen."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Falls Sie alle Bedingungen des Abkommens akzeptieren, klicken Sie auf Annehmen. Sie m�ssen die Lizenzvereinbarungen anerkennen um ${MUI_PRODUCT} zu installieren."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "W�hlen Sie die Komponenten aus"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "W�hlen Sie die Komponenten aus, die Sie installieren m�chten."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS "W�hlen Sie die Komponenten aus, die Sie installieren m�chten und w�hlen Sie diejenigen ab, die Sie nicht installieren wollen. Klicken Sie auf Weiter um fortzufahren."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Beschreibung"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Bewegen Sie den Mauszeiger �ber eine Komponente um ihre Beschreibung zu sehen."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "W�hlen Sie das Zielverzeichnis aus"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "W�hlen Sie das Verzeichnis aus, in dem ${MUI_PRODUCT} installiert werden soll."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "${MUI_PRODUCT} wird in das unten angegebene Verzeichnis installiert.$\r$\n$\r$\nKlicken Sie auf Installieren um fortzufahren. Falls Sie in ein anderes Verzeichnis installieren m�chten, klicken Sie auf Durchsuchen und w�hlen Sie ein anderes Verzeichnis aus."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Zielverzeichnis"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Installiere..."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Bitte warten Sie, w�hrend ${MUI_PRODUCT} installiert wird."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISHED_TITLE "Fertig"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISHED_SUBTITLE "Die Installation wurde erfolgreich abgeschlossen."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Sind Sie sicher, dass Sie die Installation von ${MUI_PRODUCT} abbrechen wollen?"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WINDOWTITLE "${MUI_NAME} Installation"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "Deinstallation von ${MUI_PRODUCT}"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "Entferne ${MUI_PRODUCT} von ihrem System."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "Deinstalliert ${MUI_PRODUCT} von ihrem System."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Deinstalliere..."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Bitte warten Sie, w�hrend ${MUI_PRODUCT} entfernt wird."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_TITLE "Fertig"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISHED_SUBTITLE "Die Deinstallation von ${MUI_PRODUCT} wurde erfolgreich abgeschlossen."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_WINDOWTITLE "${MUI_NAME} Deinstallation"

!insertmacro MUI_LANGUAGEFILE_END