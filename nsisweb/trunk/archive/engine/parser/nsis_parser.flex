%option main

%{
#include <stdlib.h>
#include <string.h>

//#define YY_USER_INIT printf("<pre>");

int i,iskeyword;
char *keywords[] = {
	"Function",
	"FunctionEnd",
	".onGUIInit",
	".onInit",
	".onInstFailed",
	".onInstSuccess",
	".onMouseOverSection",
	".onSelChange",
	".onUserAbort",
	".onVerifyInstDir",
	"un.onGUIInit",
	"un.onInit",
	"un.onUninstFailed",
	"un.onUninstSuccess",
	"un.onUserAbort",
	"$INSTDIR",
	"$OUTDIR",
	"$0",
	"$1",
	"$2",
	"$3",
	"$4",
	"$5",
	"$6",
	"$7",
	"$8",
	"$9",
	"$R0",
	"$R1",
	"$R2",
	"$R3",
	"$R4",
	"$R5",
	"$R6",
	"$R7",
	"$R8",
	"$R9",
	"$CMDLINE",
	"$LANGUAGE",
	"$PROGRAMFILES",
	"$DESKTOP",
	"$EXEDIR",
	"${NSISDIR}",
	"$WINDIR",
	"$SYSDIR",
	"$TEMP",
	"$STARTMENU",
	"$SMPROGRAMS",
	"$SMSTARTUP",
	"$QUICKLAUNCH",
	"$HWNDPARENT",
	"$PLUGINSDIR",
	"$$",
	"$\\r",
	"$\\n",
	"Page",
	"UninstPage",
	"AddBrandingImage",
	"AllowRootDirInstall",
	"AutoCloseWindow",
	"BGGradient",
	"BrandingText",
	"Caption",
	"ChangeUI",
	"CheckBitmap",
	"CompletedText",
	"ComponentText",
	"CRCCheck",
	"DetailsButtonText",
	"DirShow",
	"DirText",
	"FileErrorText",
	"InstallButtonText",
	"InstallColors",
	"InstallDir",
	"InstallDirRegKey",
	"InstProgressFlags",
	"InstType",
	"LicenseBkColor",
	"LicenseData",
	"LicenseText",
	"LoadLanguageFile",
	"Name",
	"Icon",
	"OutFile",
	"PluginDir",
	"SetFont",
	"ShowInstDetails",
	"ShowUninstDetails",
	"SilentInstall",
	"SilentUnInstall",
	"SpaceTexts",
	"UninstallButtonText",
	"UninstallCaption",
	"UninstallIcon",
	"UninstallSubCaption",
	"UninstallText",
	"WindowIcon",
	"XPStyle",
	"SetCompress",
	"SetCompressor",
	"SetDatablockOptimize",
	"SetDateSave",
	"SetOverwrite",
	"SetPluginUnload",
	"AddSize",
	"Section",
	"SectionEnd",
	"SectionIn",
	"SubSection",
	"SubSectionEnd",
	"Delete",
	"File",
	"Exec",
	"ExecShell",
	"ExecWait",
	"Rename",
	"RMDir",
	"ReserveFile",
	"SetOutPath",
	"DeleteINISec",
	"DeleteINIStr",
	"DeleteRegKey",
	"DeleteRegValue",
	"EnumRegKey",
	"EnumRegValue",
	"ExpandEnvStrings",
	"ReadEnvStr",
	"ReadINIStr",
	"ReadRegDWORD",
	"ReadRegStr",
	"WriteINIStr",
	"WriteRegBin",
	"WriteRegDWORD",
	"WriteRegStr",
	"CallInstDLL",
	"CopyFiles",
	"CreateDirectory",
	"CreateShortCut",
	"GetDLLVersion",
	"GetDLLVersionLocal",
	"GetFileTime",
	"GetFileTimeLocal",
	"GetFullPathName",
	"GetTempFileName",
	"SearchPath",
	"SetFileAttributes",
	"RegDLL",
	"UnRegDLL",
	"Abort",
	"Call",
	"ClearErrors",
	"GetCurrentAddress",
	"GetFunctionAddress",
	"GetLabelAddress",
	"Goto",
	"IfErrors",
	"IfFileExists",
	"IfRebootFlag",
	"IntCmp",
	"IntCmpU",
	"MessageBox",
	"Return",
	"Quit",
	"SetErrors",
	"StrCmp",
	"FileClose",
	"FileOpen",
	"FileRead",
	"FileReadByte",
	"FileSeek",
	"FileWrite",
	"FileWriteByte",
	"FindClose",
	"FindFirst",
	"FindNext",
	"InitPluginsDir",
	"SetShellVarContext",
	"Sleep",
	"StrCpy",
	"StrLen",
	"Exch",
	"Pop",
	"Push",
	"IntFmt",
	"IntOp",
	"Reboot",
	"SetRebootFlag",
	"LogSet",
	"LogText",
	"SectionSetFlags",
	"SectionGetFlags",
	"SectionSetText",
	"SectionGetText",
	"BringToFront",
	"CreateFont",
	"DetailPrint",
	"FindWindow",
	"GetDlgItem",
	"HideWindow",
	"IsWindow",
	"SendMessage",
	"SetAutoClose",
	"SetBrandingImage",
	"SetDetailsView",
	"SetDetailsPrint",
	"SetStaticBkColor",
	"SetWindowLong",
	"ShowWindow",
	"LoadLanguageFile",
	"LangString",
	"LangStringUP",
	"license",
	"components",
	"directory",
	"instfiles",
	"uninstConfirm",
	"/TRIM",
	"/LANG",
	"/windows",
	"/NOCUSTOM",
	"/CUSTOMSTRING",
	"/COMPONENTSONLYONCUSTOM",
	"hide",
	"show",
	"nevershow",
	"normal",
	"silent",
	"silentlog",
	"on",
	"off",
	"auto",
	"force",
	"zlib",
	"bzip2",
	"try",
	"ifnewer",
	"manual",
	"alwaysoff",
	"/e",
	"RO",
	"/REBOOTOK",
	"/nonfatal",
	"/a",
	"/r",
	"/oname",
	"SW_SHOWNORMAL",
	"SW_SHOWMAXIMIZED",
	"SW_SHOWMINIMIZED",
	"/NOUNLOAD",
	"/SILENT",
	"/FILESONLY",
	"/SHORT",
	"MB_OK",
	"MB_OKCANCEL",
	"MB_ABORTRETRYIGNORE",
	"MB_RETRYCANCEL",
	"MB_YESNO",
	"MB_YESNOCANCEL",
	"MB_ICONEXCLAMATION",
	"MB_ICONINFORMATION",
	"MB_ICONQUESTION",
	"MB_ICONSTOP",
	"MB_TOPMOST",
	"MB_SETFOREGROUND",
	"MB_RIGHT",
	"MB_DEFBUTTON1",
	"MB_DEFBUTTON2",
	"MB_DEFBUTTON3",
	"MB_DEFBUTTON4",
	"IDABORT",
	"IDCANCEL",
	"IDIGNORE",
	"IDNO",
	"IDOK",
	"IDRETRY",
	"IDYES",
	"current",
	"all",
	"true",
	"false",
	"/TIMEOUT",
	"/IMGID",
	"/RESIZETOFIT",
	"none",
	"listonly",
	"textonly",
	"both",
	"lastused",
	"/ITALIC",
	"/UNDERLINE",
	"/STRIKE",
	"smooth",
	"MUI_PRODUCT",
	"MUI_VERSION",
	"MUI_WELCOMEPAGE",
	"MUI_LICENSEPAGE",
	"MUI_COMPONENTSPAGE",
	"MUI_DIRECTORYPAGE",
	"MUI_STARTMENUPAGE",
	"MUI_STARTMENUVARIABLE",
	"MUI_STARTMENUDEFAULTFOLDER",
	"MUI_FINISHPAGE",
	"MUI_FINISHPAGE_RUN",
	"MUI_FINISHPAGE_RUN_PARAMETERS",
	"MUI_FINISHPAGE_RUN_NOTCHECKED",
	"MUI_FINISHPAGE_SHOWREADME",
	"MUI_FINISHPAGE_SHOWREADME_NOTCHECKED",
	"MUI_FINISHPAGE_NOAUTOCLOSE",
	"MUI_FINISHPAGE_NOREBOOTSUPPORT",
	"MUI_ABORTWARNING",
	"MUI_CUSTOMPAGECOMMANDS",
	"MUI_CUSTOMGUIINIT",
	"MUI_UNINSTALLER",
	"MUI_UNCONFIRMPAGE",
	"MUI_UNCUSTOMPAGECOMMANDS",
	"MUI_UNCUSTOMGUIINIT",
	"MUI_UI",
	"MUI_ICON",
	"MUI_UNICON",
	"MUI_CHECKBITMAP",
	"MUI_FONT",
	"MUI_FONTSIZE",
	"MUI_FONT_HEADER",
	"MUI_FONTSIZE_HEADER",
	"MUI_FONTSTYLE_HEADER",
	"MUI_INSTALLCOLORS",
	"MUI_PROGRESSBAR",
	"MUI_SPECIALINI",
	"MUI_SPECIALBITMAP",
	"MUI_BGCOLOR",
	"MUI_SYSTEM",
	"MUI_LANGUAGE",
	"MUI_BRANDINGTEXT",
	"MUI_SECTIONS_FINISHHEADER",
	"MUI_UNFINISHHEADER",
	"MUI_FUNCTIONS_DESCRIPTION_BEGIN",
	"MUI_FUNCTIONS_DESCRIPTION_TEXT",
	"MUI_FUNCTIONS_DESCRIPTION_END",
	"MUI_PAGECOMMAND_WELCOME",
	"MUI_PAGECOMMAND_LICENSE",
	"MUI_PAGECOMMAND_COMPONENTS",
	"MUI_PAGECOMMAND_DIRECTORY",
	"MUI_PAGECOMMAND_INSTFILES",
	"MUI_PAGECOMMAND_FINISH",
	"MUI_UNPAGECOMMAND_CONFIRM",
	"MUI_UNPAGECOMMAND_INSTFILES",
	"MUI_INSTALLOPTIONS_EXTRACT",
	"MUI_HEADER_TEXT",
	"MUI_INSTALLOPTIONS_DISPLAY",
	"MUI_INSTALLOPTIONS_INITDIALOG",
	"MUI_INSTALLOPTIONS_SHOW",
	"MUI_INSTALLOPTIONS_READ",
	"MUI_INSTALLOPTIONS_WRITE",
	"MUI_RESERVEFILE_WELCOMEFINISHPAGE",
	"MUI_RESERVEFILE_INSTALLOPTION",
	"MUI_RESERVEFILE_LANGDLL"
};
%}

%x SLCOMMENT STRING STRING2 STRING3 VAR PREPROCESSOR

SWC		[A-Za-z_]
WWC		[_A-Za-z0-9]
OC		[0-7]
DC		[0-9]
HC		[0-9A-Fa-f]
EOL		(\r?\n)
WS		[ \t]
SPACE	{WS}*
WORD	{SWC}{WWC}*
SYMB	[<>(){}\[\]+\-*=&|~`\/\\,.:;!$?%]

%%

<INITIAL,PREPROCESSOR>{
	;					BEGIN(SLCOMMENT); printf("<span style=\"color:#008000\">%s",yytext);
	#					BEGIN(SLCOMMENT); printf("<span style=\"color:#008000\">%s",yytext);
}

<INITIAL,STRING,STRING2,STRING3>{
	$\{{WORD}\}	  printf("<span style=\"color:#A06000\">%s</span>",yytext);
	${WWC}+				printf("<span style=\"color:#A06000\">%s</span>",yytext);
	$\\[rn]				printf("<span style=\"color:#A06000\">%s</span>",yytext);
}

<INITIAL>{
	\"					BEGIN(STRING);	printf("<span style=\"color:#808000\">%s",yytext);
	\'					BEGIN(STRING2);	printf("<span style=\"color:#808000\">%s",yytext);
	\`					BEGIN(STRING3); printf("<span style=\"color:#808000\">%s",yytext);

	^{SPACE}!{SPACE}[a-z]+	{ //preprocessor
                printf("<span style=\"color:#000080\"><b>%s</b></span>",yytext);
								BEGIN(PREPROCESSOR);
							}

	^{SPACE}{WORD}{SPACE}:	printf("<span style=\"color:#007070\">%s</span>",yytext);

	{WORD}	{
        for(i=0,iskeyword=0; !iskeyword && i<sizeof(keywords)/sizeof(char*); i++) {
				  if(stricmp(yytext,keywords[i])==0) iskeyword=1;
        }
        if(iskeyword) {
          printf("<span style=\"color:#0000ff\">%s</span>",yytext);
        } else {
          ECHO;
        }
			}	

	 /* numbers */
	[a-fA-F0-9]+	printf("<span style=\"color:#000080\">%s</span>",yytext);

	{SYMB}				printf("<span style=\"color:#008080\">%s</span>",yytext);

	 /* invalid chars - all second part of the ASCII table */
	[\x80-\xFF]+	

  /*<<EOF>>       printf("</pre>"); yyterminate();*/
}

<SLCOMMENT>{
	{EOL}				BEGIN(INITIAL); printf("%s</span>",yytext); 
}

<STRING,STRING2,STRING3>{
	\\{EOL}			ECHO;

	/*invalid end-of-line*/
	{EOL}				printf("%s</span>",yytext); BEGIN(INITIAL);
}
<STRING>{
	\"					printf("%s</span>",yytext); BEGIN(INITIAL);
}
<STRING2>{
	\'					printf("%s</span>",yytext); BEGIN(INITIAL);
}
<STRING3>{
	\`					printf("%s</span>",yytext); BEGIN(INITIAL);
}

<PREPROCESSOR>{
	{EOL}				BEGIN(INITIAL);   ECHO;
}

<*>{
	{WORD} |
	{SPACE}+ |
	{EOL} |
	.					  ECHO;
}
