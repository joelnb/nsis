<?php
global $BEAUT_PATH;
if (!isset ($BEAUT_PATH)) return;

require_once($BEAUT_PATH.'/Beautifier/HFile.php');

class HFile_nsis extends HFile{

 function HFile_nsis(){

    $this->HFile();	


/*************************************/
// Beautifier Highlighting Configuration File 
// NSIS
/*************************************/
// Flags

$this->nocase            	= "1";
$this->notrim            	= "1";
$this->perl              	= "0";

// Colours

$this->colours        		= array("purple","yellow","green","red","yellow","blue","orange","brown");
$this->quotecolour       	= "red";
$this->blockcommentcolour	= "green";
$this->linecommentcolour 	= "green";
$this->prepro			= "!";
$this->preprocolour		= "yellow";

// Indent Strings

$this->indent            	= array("");//"Function", "Section");
$this->unindent          	= array("");//"FunctionEnd", "SectionEnd");

$this->selecton			= "<!";
$this->selectoff		= "!>0";

// String characters and delimiters

$this->stringchars       	= array("\"", "'","`");
$this->delimiters        	= array("/", "$", "!", "@", "%", "^", "&", "*", "(", ")", "+", "=", "|", "\\", "{", "}", "[", "]", ":", ";", "\"", "'", "<", ">", " ", ",", "	", ".", "?");
$this->escchar           	= "\\";

// Comment settings

$this->linecommenton     	= array(";", "#");
$this->blockcommenton    	= array("");
$this->blockcommentoff   	= array("");

// Keywords (keyword mapping to colour number)

$this->keywords = array(
	"SetOutPath" => "1",
	"File" => "1",
	"Exec" => "1",
	"ExecWait" => "1",
	"ExecShell" => "1",
	"Rename" => "1",
	"Delete" => "1",
	"RMDir" => "1",
	"WriteRegStr" => "1",
	"WriteRegExpandStr" => "1",
	"WriteRegDWORD" => "1",
	"WriteRegBin" => "1",
	"WriteINIStr" => "1",
	"ReadRegStr" => "1",
	"ReadRegDWORD" => "1",
	"ReadINIStr" => "1",
	"ReadEnvStr" => "1",
	"ExpandEnvStrings" => "1",
	"DeleteRegValue" => "1",
	"DeleteRegKey" => "1",
	"EnumRegKey" => "1",
	"EnumRegValue" => "1",
	"DeleteINISec" => "1",
	"DeleteINIStr" => "1",
	"CreateDirectory" => "1",
	"CopyFiles" => "1",
	"SetFileAttributes" => "1",
	"CreateShortCut" => "1",
	"GetFullPathName" => "1",
	"SearchPath" => "1",
	"GetTempFileName" => "1",
	"CallInstDLL" => "1",
	"RegDLL" => "1",
	"UnRegDLL" => "1",
	"GetDllVersion" => "1",
	"GetDLLVersionLocal" => "1",
	"GetFileTime" => "1",
	"GetFileTimeLocal" => "1",
	"PluginDir" => "1",
	"Goto" => "1",
	"Call" => "1",
	"Return" => "1",
	"IfErrors" => "1",
	"ClearErrors" => "1",
	"SetErrors" => "1",
	"FindWindow" => "1",
	"SendMessage" => "1",
	"IsWindow" => "1",
	"SetDlgItemText" => "1",
	"IfFileExists" => "1",
	"MessageBox" => "1",
	"StrCmp" => "1",
	"IntCmp" => "1",
	"IntCmpU" => "1",
	"Abort" => "1",
	"Quit" => "1",
	"GetFunctionAddress" => "1",
	"GetLabelAddress" => "1",
	"GetCurrentAddress" => "1",
	"FindFirst" => "1",
	"FindNext" => "1",
	"FindClose" => "1",
	"FileOpen" => "1",
	"FileClose" => "1",
	"FileRead" => "1",
	"FileWrite" => "1",
	"FileReadByte" => "1",
	"FileWriteByte" => "1",
	"FileSeek" => "1",
	"SetDetailsView" => "1",
	"SetDetailsPrint" => "1",
	"SetAutoClose" => "1",
	"DetailPrint" => "1",
	"Sleep" => "1",
	"BringToFront" => "1",
	"HideWindow" => "1",
	"SetShellVarContext" => "1",
	"SetBrandingImage" => "1",
	"StrCpy" => "1",
	"StrLen" => "1",
	"Push" => "1",
	"Pop" => "1",
	"Exch" => "1",
	"IntOp" => "1",
	"IntFmt" => "1",
	"Reboot" => "1",
	"IfRebootFlag" => "1",
	"SetRebootFlag" => "1",
	"WriteUninstaller" => "1",
	"LogSet" => "1",
	"LogText" => "1",
	"SectionSetFlags" => "1",
	"SectionGetFlags" => "1",
	"SectionSetText" => "1",
	"SectionGetText" => "1",
	"OutFile" => "2",
	"Name" => "2",
	"Caption" => "2",
	"SubCaption" => "2",
	"BrandingText" => "2",
	"Icon" => "2",
	"WindowIcon" => "2",
	"XPStyle" => "2",
	"AddBrandingImage" => "2",
	"SetFont" => "2",
	"ChangeUI" => "2",
	"UseOuterItem" => "2",
	"LoadLanguageFile" => "2",
	"BGGradient" => "2",
	"SilentInstall" => "2",
	"SilentUnInstall" => "2",
	"CRCCheck" => "2",
	"MiscButtonText" => "2",
	"InstallButtonText" => "2",
	"FileErrorText" => "2",
	"InstallDir" => "2",
	"InstallDirRegKey" => "2",
	"LicenseText" => "2",
	"LicenseData" => "2",
	"LicenseBkColor" => "2",
	"ComponentText" => "2",
	"InstType" => "2",
	"CheckBitmap" => "2",
	"SpaceTexts" => "2",
	"DirShow" => "2",
	"DirText" => "2",
	"AllowRootDirInstall" => "2",
	"InstallColors" => "2",
	"InstProgressFlags" => "2",
	"AutoCloseWindow" => "2",
	"ShowInstDetails" => "2",
	"DetailsButtonText" => "2",
	"CompletedText" => "2",
	"UninstallText" => "2",
	"UninstallIcon" => "2",
	"UninstallCaption" => "2",
	"UninstallSubCaption" => "2",
	"ShowUninstDetails" => "2",
	"UninstallButtonText" => "2",
	"SetOverwrite" => "3",
	"SetCompress" => "3",
	"SetCompressor" => "3",
	"SetDatablockOptimize" => "3",
	"SetDateSave" => "3",
	"Section" => "4",
	"SectionIn" => "4",
	"SectionEnd" => "4",
	"SubSection" => "4",
	"SubSectionEnd" => "4",
	"AddSize" => "4",
	"Function" => "5",
	"FunctionEnd" => "5",
	"$INSTDIR" => "6",
	"$OUTDIR" => "6",
	"$0" => "6",
	"$1" => "6",
	"$2" => "6",
	"$3" => "6",
	"$4" => "6",
	"$5" => "6",
	"$6" => "6",
	"$7" => "6",
	"$8" => "6",
	"$9" => "6",
	"$R0" => "6",
	"$R1" => "6",
	"$R2" => "6",
	"$R3" => "6",
	"$R4" => "6",
	"$R5" => "6",
	"$R6" => "6",
	"$R7" => "6",
	"$R8" => "6",
	"$R9" => "6",
	"$CMDLINE" => "6",
	"$PROGRAMFILES" => "6",
	"$DESKTOP" => "6",
	"$EXEDIR" => "6",
	"$WINDIR" => "6",
	"$SYSDIR" => "6",
	"$TEMP" => "6",
	"$STARTMENU" => "6",
	"$SMPROGRAMS" => "6",
	"$SMSTARTUP" => "6",
	"$QUICKLAUNCH" => "6",
	"$LANGUAGE" => "6",
	"$HWNDPARENT" => "6",
	"$$" => "6",
	"$\r" => "6",
	"$\n" => "6",
	"${NSISDIR}" => "6",
	".onInit" => "7",
	".onUserAbort" => "7",
	".onInstSuccess" => "7",
	".onInstFailed" => "7",
	".onVerifyInstDir" => "7",
	".onNextPage" => "7",
	".onPrevPage" => "7",
	".onSelChange" => "7",
	"un.onInit" => "7",
	"un.onUserAbort" => "7",
	"un.onUninstSuccess" => "7",
	"un.onUninstFailed" => "7",
	"un.onNextPage" => "7",
	"!system" => "8",
	"!include" => "8",
	"!cd" => "8",
	"!packhdr" => "8",
	"!define" => "8",
	"!undef" => "8",
	"!ifdef" => "8",
	"!ifndef" => "8",
	"!endif" => "8",
	"!else" => "8",
	"!echo" => "8",
	"!warning" => "8",
	"!error" => "8",
	"!macro" => "8",
	"!verbose" => "8",
	"!macro" => "8",
	"!macroend" => "8",
	"!insertmacro" => "8"
);

// Special extensions

// Each category can specify a PHP function that returns an altered
// version of the keyword.



$this->linkscripts    	= array(
			"1" => "donothing",
			"2" => "donothing",
			"3" => "donothing",
			"4" => "donothing",
			"5" => "donothing",
			"6" => "donothing",
			"7" => "donothing",
	                "8" => "donothing");
}

function donothing($keywordin)
{
	return $keywordin;
}

function dofunction($keywordin)
{
	$outlink = "http://www.php.net/manual/en/function.".strtr($keywordin, "_", "-").".php";
	return "<a href=\"$outlink\">$keywordin</a>";
}



}
?>
