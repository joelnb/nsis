;NSIS Modern User Interface - Turkish Language File
;Compatible with Modern UI 1.65

;Language: Turkish (1055)
;By Fatih BOY (fatih@smartcoding.org)

;--------------------------------

!insertmacro MUI_LANGUAGEFILE_BEGIN "TURKISH"

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_LANGNAME "Turkish";

  !insertmacro MUI_LANGUAGEFILE_STRING MUI_NAME "${MUI_PRODUCT} ${MUI_VERSION}"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_NEXT "Devam'a tiklayin."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_CONTINUE_INSTALL "Kurulumu baslatmak i�in KUR'a tiklayiniz."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TITLE "${MUI_PRODUCT} Kurulum Sihirbazina hosgeldiniz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_WELCOME_INFO_TEXT "Bu sihirbaz size ${MUI_PRODUCT} kurulumu boyunca rehberlik edecektir.\r\n\r\nKurulumu baslatmadan �nce �alisan diger programlari kapatmanizi �neririz. B�ylece bilgisayarinizi yeniden baslatmadan bazi sistem dosyalari sorunsuz kurulabilir.\r\n\r\n"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_TITLE "S�zlesme"  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_LICENSE_SUBTITLE "L�tfen ${MUI_PRODUCT} programini kurmadan �nce s�zlesmeyi okuyunuz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_TOP "S�zlesmenin gire kalanini g�rmek i�in Page Down'a basabilirsiniz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM "If you accept the terms of the agreement, click I Agree to continue. You must accept the agreement to install ${MUI_PRODUCT}."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_CHECKBOX "S�zlesmeyi kabul ediyorsaniz 'Kabul'e basin. ${MUI_PRODUCT} programini kurabilmeniz i�in s�zlesmeyi kabul etmeniz gerekli."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_LICENSE_BOTTOM_RADIOBUTTONS "S�zlesmeyi kabul ediyorsaniz, asagidaki ilk se�enegi se�iniz. ${MUI_PRODUCT} programini kurabilmeniz i�in s�zlesmeyi kabul etmeniz gerekli."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_TITLE "Paket Se�imi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_COMPONENTS_SUBTITLE "L�tfen ${MUI_PRODUCT} i�in kurmak istediginiz paketleri se�in."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_TOP "Kurulmasini istediginiz paketleri isaretleyiniz, kurulmasini istemediginiz paketlerin ise isaretlerini kaldiriniz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_TITLE "A�iklama"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_COMPONENTS_DESCRIPTION_INFO "Paketlerin a�iklamalarini g�rmek i�in mouse ile �zerine gelin."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_TITLE "Hedef dizini se�in"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_DIRECTORY_SUBTITLE "${MUI_PRODUCT} programini kurmak istediginiz dizini se�in."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_TOP "${MUI_PRODUCT} asagida belirttiginiz dizine kurulacak.$\r$\n$\r$\nFarkli bir dizine kurmak istiyorsaniz, 'Farkli Dizin'e tiklayin."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_DIRECTORY_DESTINATION "Hedef Dizin"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_TITLE "Kuruluyor"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_INSTALLING_SUBTITLE "L�tfen ${MUI_PRODUCT} kurulurken bekleyiniz"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_TITLE "Kurulum Tamamlandi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SUBTITLE "Kurulum basariyla ger�eklesti."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_TITLE "Kurulum Iptal Edildi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORT_SUBTITLE "Kurulum basariyla ger�eklestirilemedi."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_BUTTON "&Bitir"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TITLE "${MUI_PRODUCT} Kurulumu Tamamlaniyor"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_TEXT "${MUI_PRODUCT} basariyla bilgisayariniza y�klendi.\r\n\r\nL�tfen 'Bitir'e basarak kurulumu sonlandirin."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_INFO_REBOOT "${MUI_PRODUCT} kurulumunun tamamlanmasi i�in bilgisayarinizi yeniden baslatmaniz gerekli. Bunu simdi yapmak istiyor musunuz?"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTNOW "Yeniden baslat"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_REBOOTLATER "Bilgisayari daha sonra elle tekrar baslatacagim"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_RUN "${MUI_PRODUCT} programini &�alistir"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_FINISH_SHOWREADME "'Beni Oku' dosyasini &g�ster"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_TITLE "Baslat men�s� klas�r� se�imi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_STARTMENU_SUBTITLE "Programin kisayollarinin konulacagi baslat men�s� klas�r�n� se�iniz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_TOP "Programin kisayollarinin konulacagi baslat men�s� klas�r�n� se�iniz. Ayni zamanda farkli bir isim girerek yeni bir klas�r yaratabilirsiniz."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_INNERTEXT_STARTMENU_CHECKBOX "Kisa yollari olusturma"
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_TEXT_ABORTWARNING "${MUI_PRODUCT} kurulumundan �ikmak istediginize emin misiniz?"  
  
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_CONTINUE_UNINSTALL "'Kaldir'a basarak kaldirma islemini baslatabilirsiniz."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_TITLE "${MUI_PRODUCT} programini kaldir"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_INTRO_SUBTITLE "${MUI_PRODUCT} programini bilgisayarinizdan kaldirma."
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNINNERTEXT_INTRO "This wizard will uninstall ${MUI_PRODUCT} from your computer."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_TITLE "Kaldiriliyor"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_UNINSTALLING_SUBTITLE "L�tfen ${MUI_PRODUCT} kaldirilirken bekleyiniz."
    
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_TITLE "Kaldirma tamamlandi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_FINISH_SUBTITLE "Program basariyla kaldirildi."
  
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_TITLE "Program kaldirma iptal edildi"
  !insertmacro MUI_LANGUAGEFILE_STRING MUI_UNTEXT_ABORT_SUBTITLE "Program kaldirilma islemi basarisiz oldu."
  
!insertmacro MUI_LANGUAGEFILE_END