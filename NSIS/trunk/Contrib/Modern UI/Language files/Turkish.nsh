;NSIS Modern User Interface - Language File
;Compatible with Modern UI 1.66

;Language: Turkish (1055)
;By Fatih BOY (fatih@smartcoding.org)

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "TURKISH"

  !define MUI_LANGNAME "Turkish" ;Use only ASCII characters (if this is not possible, use the English name)
  
  !define MUI_TEXT_WELCOME_INFO_TITLE "$(^Name) Kurulum Sihirbazina hosgeldiniz"
  !define MUI_TEXT_WELCOME_INFO_TEXT "Bu sihirbaz size $(^Name) kurulumu boyunca rehberlik edecektir.\r\n\r\nKurulumu baslatmadan �nce �alisan diger programlari kapatmanizi �neririz. B�ylece bilgisayarinizi yeniden baslatmadan bazi sistem dosyalari sorunsuz kurulabilir.\r\n\r\n$_CLICK"
  
  !define MUI_TEXT_LICENSE_TITLE "S�zlesme"  
  !define MUI_TEXT_LICENSE_SUBTITLE "L�tfen $(^Name) programini kurmadan �nce s�zlesmeyi okuyunuz."
  !define MUI_INNERTEXT_LICENSE_TOP "S�zlesmenin geri kalanini g�rmek i�in Page Down'a basabilirsiniz."
  !define MUI_INNERTEXT_LICENSE_BOTTOM "S�zle�me ko�ullar�n� kabul ediyorsan�z, 'Kabul Ediyorum'a bas�n�z. $(^Name) program�n� kurmak i�in s�zle�me ko�ullar�n� kabul etmelisiniz."
  !define MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "S�zle�me ko�ullar�n� kabul ediyorsan�z, a�a��daki check box'a bas�n�z. $(^Name) program�n� kurmak i�in s�zle�me ko�ullar�n� kabul etmelisiniz. $_CLICK"
  !define MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "S�zle�me ko�ullar�n� kabul ediyorsan�z, asagidaki ilk se�enegi se�iniz. $(^Name) program�n� kurmak i�in s�zle�me ko�ullar�n� kabul etmelisiniz. $_CLICK"
  
  !define MUI_TEXT_COMPONENTS_TITLE "Paket Se�imi"
  !define MUI_TEXT_COMPONENTS_SUBTITLE "L�tfen $(^Name) i�in kurmak istediginiz paketleri se�iniz."
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "A�iklama"
  !define MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Paketlerin a�iklamalarini g�rmek i�in mouse ile �zerine gelin."
  
  !define MUI_TEXT_DIRECTORY_TITLE "Hedef dizini se�imi"
  !define MUI_TEXT_DIRECTORY_SUBTITLE "$(^Name) programini kurmak istediginiz dizini se�in."
  
  !define MUI_TEXT_INSTALLING_TITLE "Kuruluyor"
  !define MUI_TEXT_INSTALLING_SUBTITLE "$(^Name) kurulurken bekleyiniz."
  
  !define MUI_TEXT_FINISH_TITLE "Kurulum Tamamlandi"
  !define MUI_TEXT_FINISH_SUBTITLE "Kurulum basariyla ger�eklesti."
  
  !define MUI_TEXT_ABORT_TITLE "Kurulum Iptal Edildi"
  !define MUI_TEXT_ABORT_SUBTITLE "Kurulum basariyla ger�eklestirilemedi."
  
  !define MUI_BUTTONTEXT_FINISH "&Bitir"
  !define MUI_TEXT_FINISH_INFO_TITLE "$(^Name) Kurulumu Tamamlaniyor"
  !define MUI_TEXT_FINISH_INFO_TEXT "$(^Name)  basariyla bilgisayariniza y�klendi.\r\n\r\nL�tfen 'Bitir'e basarak kurulumu sonlandirin."
  !define MUI_TEXT_FINISH_INFO_REBOOT "$(^Name) kurulumunun tamamlanmasi i�in bilgisayarinizi yeniden baslatmaniz gerekli. Bunu simdi yapmak istiyor musunuz?"
  !define MUI_TEXT_FINISH_REBOOTNOW "Yeniden baslat"
  !define MUI_TEXT_FINISH_REBOOTLATER "Bilgisayari daha sonra elle tekrar baslatacagim"
  !define MUI_TEXT_FINISH_RUN "$(^Name) programini &�alistir"
  !define MUI_TEXT_FINISH_SHOWREADME "'Beni Oku' dosyasini &g�ster"
  
  !define MUI_TEXT_STARTMENU_TITLE "Baslat men�s� klas�r� se�imi"
  !define MUI_TEXT_STARTMENU_SUBTITLE "$(^Name) kisayollarinin konulacagi baslat men�s� klas�r�n� se�iniz."
  !define MUI_INNERTEXT_STARTMENU_TOP "Programin kisayollarinin konulacagi baslat men�s� klas�r�n� se�iniz. Farkli bir isim girerek yeni bir klas�r yaratabilirsiniz."
  !define MUI_INNERTEXT_STARTMENU_CHECKBOX "Kisa yollari olusturma"
  
  !define MUI_TEXT_ABORTWARNING "$(^Name) kurulumundan �ikmak istediginize emin misiniz?"  
  
  
  !define MUI_UNTEXT_CONFIRM_TITLE "$(^Name) programini kaldir"
  !define MUI_UNTEXT_CONFIRM_SUBTITLE "$(^Name) programini bilgisayarinizdan kaldirma."
  
  !define MUI_UNTEXT_LICENSE_TITLE "S�zlesme"  
  !define MUI_UNTEXT_LICENSE_SUBTITLE "L�tfen $(^Name) programini kald�rmadan �nce s�zlesmeyi okuyunuz."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM "S�zle�me ko�ullar�n� kabul ediyorsan�z, 'Kabul Ediyorum'a bas�n�z. $(^Name) program�n� kald�rmak i�in s�zle�me ko�ullar�n� kabul etmelisiniz."
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_CHECKBOX "S�zle�me ko�ullar�n� kabul ediyorsan�z, a�a��daki check box'a bas�n�z. $(^Name) program�n� kald�rmak i�in s�zle�me ko�ullar�n� kabul etmelisiniz. $_CLICK"
  !define MUI_UNINNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "S�zle�me ko�ullar�n� kabul ediyorsan�z, asagidaki ilk se�enegi se�iniz. $(^Name) program�n� kald�rmak i�in s�zle�me ko�ullar�n� kabul etmelisiniz. $_CLICK"
  
  !define MUI_UNTEXT_COMPONENTS_TITLE "Paket Se�imi"
  !define MUI_UNTEXT_COMPONENTS_SUBTITLE "L�tfen $(^Name) i�in kald�rmak istediginiz �zellikleri se�iniz."
  
  !define MUI_UNTEXT_DIRECTORY_TITLE "Kald�rlacak Hedef Se�imi"
  !define MUI_UNTEXT_DIRECTORY_SUBTITLE "$(^Name) programini kald�rmak istediginiz dizini se�in."
  
  !define MUI_UNTEXT_UNINSTALLING_TITLE "Kald�r�l�yor"
  !define MUI_UNTEXT_UNINSTALLING_SUBTITLE "$(^Name) kald�rl�rken bekleyiniz."
    
  !define MUI_UNTEXT_FINISH_TITLE "Kald�rma Tamamland�r"
  !define MUI_UNTEXT_FINISH_SUBTITLE "Kald�rma basariyla ger�eklesti."
  
  !define MUI_UNTEXT_ABORT_TITLE "Kald�rma Iptal Edildi"
  !define MUI_UNTEXT_ABORT_SUBTITLE "Kald�rma basariyla ger�eklestirilemedi."
  
!insertmacro MUI_LANGUAGEFILE_END