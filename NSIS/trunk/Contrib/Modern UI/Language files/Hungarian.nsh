;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Hungarian (1038)
;Translation by Jozsef Tamas Herczeg ( - 1.61-ig),
;               Lajos Molnar (Orfanik) <orfanik@axelero.hu> ( 1.62 - t�l)

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "HUNGARIAN"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Magyar" ;Name of the language in the language itself

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "�dv�zli a(z) $(^Name) Telep�t� Var�zsl�"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "A(z) $(^Name) telep�t�se k�vetkezik a sz�m�t�g�pre.\r\n\r\nJavasoljuk, hogy ind�t�s el�tt z�rja be a fut� alkalmaz�sokat. �gy a telep�t� a rendszer �jraind�t�sa n�lk�l tudja friss�teni a sz�ks�ges rendszerf�jlokat.\r\n\r\n"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "Licencszerz�d�s"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "A(z) $(^Name) telep�t�se el�tt tekintse �t a szerz�d�s felt�teleit."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "A PageDown gombbal olvashatja el a szerz�d�s folytat�s�t."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "Ha elfogadja a szerz�d�s valamennyi felt�tel�t, az Elfogadom gombbal folytathatja. El kell fogadnia a(z) $(^Name) telep�t�s�hez."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "Amennyiben elfogadja a felt�teleket, jel�lje be a jel�l�n�nyzeten. A(z) $(^Name) telep�t�s�hez el kell fogadnia a felt�teleket. $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Amennyiben elfogadja a felt�teleket, v�lassza az els� opci�t. A(z) $(^Name) telep�t�s�hez el kell fogadnia a felt�teleket. $_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "�sszetev�k kiv�laszt�sa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "V�lassza ki, hogy a(z) $(^Name) mely funkci�it k�v�nja telep�teni."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "Le�r�s"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Vigye r� az egeret az �sszetev�re, hogy megtekinthesse a le�r�s�t."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Telep�t�si hely kiv�laszt�sa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "V�lassza ki a(z) $(^Name) telep�t�s�nek mapp�j�t."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Telep�t�si folyamat"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "Kis t�relmet a(z) $(^Name) telep�t�s�ig."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Telep�t�s befejez�d�tt"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "A telep�t�s sikeresen befejez�d�tt."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "A telep�t�s megszakadt"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "A telep�t�s sikertelen volt."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_BUTTONTEXT_FINISH "&Befejez�s"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "A(z) $(^Name) telep�t�se megt�rt�nt."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "A(z) $(^Name) telep�t�se megt�rt�nt.\r\n\r\nA Befejez�s gomb megnyom�s�val z�rja be a var�zsl�t."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "A(z) $(^Name) telep�t�s�nek befejez�s�hez �jra kell ind�tani a rendszert. Most akarja �jraind�tani?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Most ind�tom �jra"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "K�s�bb fogom �jraind�tani"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "$(^Name) futtat�sa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "OlvassEl f�jl megjelen�t�se"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Start men� mappa kijel�l�se"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Start men� mappa kijel�l�se a program parancsikonjaihoz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Jel�lj�n ki egy mapp�t a Start men�ben, melybe a program parancsikonjait fogja elhelyezni. Be�rhatja �j mappa nev�t is."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Nincs parancsikon elhelyez�s"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "Biztos, hogy ki akar l�pni a(z) $(^Name) Telep�t�b�l?"


  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_TITLE "A(z) $(^Name) Elt�vol�t�sa."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONFIRM_SUBTITLE "A(z) $(^Name) elt�vol�t�sa k�vetkezik a sz�m�t�g�pr�l."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_TITLE "Licencszerz�d�s"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_LICENSE_SUBTITLE "A(z) $(^Name) elt�vol�t�sa el�tt tekintse �t a szerz�d�s felt�teleit."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM "Ha elfogadja a szerz�d�s valamennyi felt�tel�t, az Elfogadom gombbal folytathatja. El kell fogadnia a(z) $(^Name) elt�vol�t�s�hoz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "Amennyiben elfogadja a felt�teleket, jel�lje be a jel�l�n�nyzeten. A(z) $(^Name) elt�vol�t�s�hoz el kell fogadnia a felt�teleket. $_CLICK"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "Amennyiben elfogadja a felt�teleket, v�lassza az els� opci�t. A(z) $(^Name) elt�vol�t�s�hoz el kell fogadnia a felt�teleket. $_CLICK"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_TITLE "�sszetev�k kiv�laszt�sa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_COMPONENTS_SUBTITLE "V�lassza ki, hogy a(z) $(^Name) mely funkci�it k�v�nja elt�vol�tani."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_TITLE "Telep�t�si hely kiv�laszt�sa"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_DIRECTORY_SUBTITLE "V�lassza ki a(z) $(^Name) telep�t�s�nek mapp�j�t."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Elt�vol�t�si folyamat"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "Kis t�relmet a(z) $(^Name) elt�vol�t�s�ig."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Az elt�vol�t�s befejez�d�tt"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Az elt�vol�t�s sikeresen befejez�d�tt."

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Az elt�vol�t�s megszakadt"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Az elt�vol�t�s sikertelen volt."

!insertmacro MUI_LANGUAGEFILE_END


