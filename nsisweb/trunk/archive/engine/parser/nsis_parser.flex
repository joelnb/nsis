%option main

%{
#include <stdlib.h>
#include <string.h>

//#define YY_USER_INIT printf("<pre>");

#define INSTRUCTION "ahinstruction"
#define CALLBACK "ahcallback"
#define ATTRIBUTE "ahattribute"
#define PARAMETER "ahparam"

int i,iskeyword;
struct keyword {
	char *name;
	char *color;
} keywords[] = {
	{"Function", ATTRIBUTE},
	{"FunctionEnd", ATTRIBUTE},
	{".onGUIInit", CALLBACK},
	{".onInit", CALLBACK},
	{".onInstFailed", CALLBACK},
	{".onInstSuccess", CALLBACK},
	{".onMouseOverSection", CALLBACK},
	{".onSelChange", CALLBACK},
	{".onUserAbort", CALLBACK},
	{".onVerifyInstDir", CALLBACK},
	{"un.onGUIInit", CALLBACK},
	{"un.onInit", CALLBACK},
	{"un.onUninstFailed", CALLBACK},
	{"un.onUninstSuccess", CALLBACK},
	{"un.onUserAbort", CALLBACK},
	
	// doesn't work atm
	/*{"$INSTDIR", },
	{"$OUTDIR", },
	{"$0", },
	{"$1", },
	{"$2", },
	{"$3", },
	{"$4", },
	{"$5", },
	{"$6", },
	{"$7", },
	{"$8", },
	{"$9", },
	{"$R0", },
	{"$R1", },
	{"$R2", },
	{"$R3", },
	{"$R4", },
	{"$R5", },
	{"$R6", },
	{"$R7", },
	{"$R8", },
	{"$R9", },
	{"$CMDLINE", },
	{"$LANGUAGE", },
	{"$PROGRAMFILES", },
	{"$DESKTOP", },
	{"$EXEDIR", },
	{"${NSISDIR}", },
	{"$WINDIR", },
	{"$SYSDIR", },
	{"$TEMP", },
	{"$STARTMENU", },
	{"$SMPROGRAMS", },
	{"$SMSTARTUP", },
	{"$QUICKLAUNCH", },
	{"$HWNDPARENT", },
	{"$PLUGINSDIR", },
	{"$$", },
	{"$\\r", },
	{"$\\n", },*/

	{"Page", ATTRIBUTE},
	{"PageEx", ATTRIBUTE},
	{"UninstPage", ATTRIBUTE},
	{"PageCallbacks", ATTRIBUTE},
	{"AddBrandingImage", ATTRIBUTE},
	{"AllowRootDirInstall", ATTRIBUTE},
	{"AutoCloseWindow", ATTRIBUTE},
	{"BGGradient", ATTRIBUTE},
	{"BrandingText", ATTRIBUTE},
	{"Caption", ATTRIBUTE},
	{"ChangeUI", ATTRIBUTE},
	{"CheckBitmap", ATTRIBUTE},
	{"CompletedText", ATTRIBUTE},
	{"ComponentText", ATTRIBUTE},
	{"CRCCheck", ATTRIBUTE},
	{"DetailsButtonText", ATTRIBUTE},
	{"DirShow", ATTRIBUTE},
	{"DirText", ATTRIBUTE},
	{"DirVar", ATTRIBUTE},
	{"FileErrorText", ATTRIBUTE},
	{"InstallButtonText", ATTRIBUTE},
	{"InstallColors", ATTRIBUTE},
	{"InstallDir", ATTRIBUTE},
	{"InstallDirRegKey", ATTRIBUTE},
	{"InstProgressFlags", ATTRIBUTE},
	{"InstType", ATTRIBUTE},
	{"LicenseBkColor", ATTRIBUTE},
	{"LicenseData", ATTRIBUTE},
	{"LicenseText", ATTRIBUTE},
	{"LoadLanguageFile", ATTRIBUTE},
	{"Name", ATTRIBUTE},
	{"Icon", ATTRIBUTE},
	{"OutFile", ATTRIBUTE},
	{"SetFont", ATTRIBUTE},
	{"ShowInstDetails", ATTRIBUTE},
	{"ShowUninstDetails", ATTRIBUTE},
	{"SilentInstall", ATTRIBUTE},
	{"SilentUnInstall", ATTRIBUTE},
	{"SpaceTexts", ATTRIBUTE},
	{"UninstallButtonText", ATTRIBUTE},
	{"UninstallCaption", ATTRIBUTE},
	{"UninstallIcon", ATTRIBUTE},
	{"UninstallSubCaption", ATTRIBUTE},
	{"UninstallText", ATTRIBUTE},
	{"WindowIcon", ATTRIBUTE},
	{"XPStyle", ATTRIBUTE},
	{"SetCompress", ATTRIBUTE},
	{"SetCompressor", ATTRIBUTE},
	{"SetDatablockOptimize", ATTRIBUTE},
	{"SetDateSave", ATTRIBUTE},
	{"SetOverwrite", ATTRIBUTE},
	{"SetPluginUnload", ATTRIBUTE},
	{"AddSize", ATTRIBUTE},
	{"Section", ATTRIBUTE},
	{"SectionEnd", ATTRIBUTE},
	{"SectionIn", ATTRIBUTE},
	{"SubSection", ATTRIBUTE},
	{"SubSectionEnd", ATTRIBUTE},
	{"Delete", INSTRUCTION},
	{"File", INSTRUCTION},
	{"Exec", INSTRUCTION},
	{"ExecShell", INSTRUCTION},
	{"ExecWait", INSTRUCTION},
	{"Rename", INSTRUCTION},
	{"RMDir", INSTRUCTION},
	{"ReserveFile", ATTRIBUTE},
	{"SetOutPath", INSTRUCTION},
	{"DeleteINISec", INSTRUCTION},
	{"DeleteINIStr", INSTRUCTION},
	{"DeleteRegKey", INSTRUCTION},
	{"DeleteRegValue", INSTRUCTION},
	{"EnumRegKey", INSTRUCTION},
	{"EnumRegValue", INSTRUCTION},
	{"ExpandEnvStrings", INSTRUCTION},
	{"ReadEnvStr", INSTRUCTION},
	{"ReadINIStr", INSTRUCTION},
	{"FlushINI", INSTRUCTION},
	{"ReadRegDWORD", INSTRUCTION},
	{"ReadRegStr", INSTRUCTION},
	{"WriteINIStr", INSTRUCTION},
	{"WriteRegBin", INSTRUCTION},
	{"WriteRegDWORD", INSTRUCTION},
	{"WriteRegStr", INSTRUCTION},
	{"CallInstDLL", INSTRUCTION},
	{"CopyFiles", INSTRUCTION},
	{"CreateDirectory", INSTRUCTION},
	{"CreateShortCut", INSTRUCTION},
	{"GetDLLVersion", INSTRUCTION},
	{"GetDLLVersionLocal", INSTRUCTION},
	{"GetFileTime", INSTRUCTION},
	{"GetFileTimeLocal", INSTRUCTION},
	{"GetFullPathName", INSTRUCTION},
	{"GetTempFileName", INSTRUCTION},
	{"SearchPath", INSTRUCTION},
	{"SetFileAttributes", INSTRUCTION},
	{"RegDLL", INSTRUCTION},
	{"UnRegDLL", INSTRUCTION},
	{"Abort", INSTRUCTION},
	{"Call", INSTRUCTION},
	{"ClearErrors", INSTRUCTION},
	{"GetCurrentAddress", INSTRUCTION},
	{"GetFunctionAddress", INSTRUCTION},
	{"GetLabelAddress", INSTRUCTION},
	{"Goto", INSTRUCTION},
	{"IfAbort", INSTRUCTION},
	{"IfErrors", INSTRUCTION},
	{"IfFileExists", INSTRUCTION},
	{"IfRebootFlag", INSTRUCTION},
	{"IfSilent", INSTRUCTION},
	{"IntCmp", INSTRUCTION},
	{"IntCmpU", INSTRUCTION},
	{"MessageBox", INSTRUCTION},
	{"Return", INSTRUCTION},
	{"Quit", INSTRUCTION},
	{"SetErrors", INSTRUCTION},
	{"StrCmp", INSTRUCTION},
	{"FileClose", INSTRUCTION},
	{"FileOpen", INSTRUCTION},
	{"FileRead", INSTRUCTION},
	{"FileReadByte", INSTRUCTION},
	{"FileSeek", INSTRUCTION},
	{"FileWrite", INSTRUCTION},
	{"FileWriteByte", INSTRUCTION},
	{"FindClose", INSTRUCTION},
	{"FindFirst", INSTRUCTION},
	{"FindNext", INSTRUCTION},
	{"InitPluginsDir", INSTRUCTION},
	{"SetShellVarContext", INSTRUCTION},
	{"Sleep", INSTRUCTION},
	{"StrCpy", INSTRUCTION},
	{"StrLen", INSTRUCTION},
	{"Exch", INSTRUCTION},
	{"Pop", INSTRUCTION},
	{"Push", INSTRUCTION},
	{"IntFmt", INSTRUCTION},
	{"IntOp", INSTRUCTION},
	{"Reboot", INSTRUCTION},
	{"SetRebootFlag", INSTRUCTION},
	{"LogSet", INSTRUCTION},
	{"LogText", INSTRUCTION},
	{"SectionSetFlags", INSTRUCTION},
	{"SectionGetFlags", INSTRUCTION},
	{"SectionSetText", INSTRUCTION},
	{"SectionGetText", INSTRUCTION},
	{"BringToFront", INSTRUCTION},
	{"CreateFont", INSTRUCTION},
	{"DetailPrint", INSTRUCTION},
	{"FindWindow", INSTRUCTION},
	{"GetDlgItem", INSTRUCTION},
	{"HideWindow", INSTRUCTION},
	{"IsWindow", INSTRUCTION},
	{"SendMessage", INSTRUCTION},
	{"SetAutoClose", INSTRUCTION},
	{"SetBrandingImage", INSTRUCTION},
	{"SetDetailsView", INSTRUCTION},
	{"SetDetailsPrint", INSTRUCTION},
	{"SetCtlColors", INSTRUCTION},
	{"SetWindowLong", INSTRUCTION},
	{"SetSilent", INSTRUCTION},
	{"ShowWindow", INSTRUCTION},
	{"LoadLanguageFile", ATTRIBUTE},
	{"LangString", ATTRIBUTE},
	{"VIAddVersionKey", ATTRIBUTE},
	{"AllowSkipFiles", ATTRIBUTE},
	{"SectionSetSize", INSTRUCTION},
	{"SectionGetSize", INSTRUCTION},
	{"SetCurInstType", INSTRUCTION},
	{"GetCurInstType", INSTRUCTION},
	{"WriteUninstaller", INSTRUCTION},
	{"license", PARAMETER},
	{"components", PARAMETER},
	{"directory", PARAMETER},
	{"instfiles", PARAMETER},
	{"uninstConfirm", PARAMETER},
	{"un.license", PARAMETER},
	{"un.components", PARAMETER},
	{"un.directory", PARAMETER},
	{"un.instfiles", PARAMETER},
	{"un.uninstConfirm", PARAMETER},
	{"/TRIM", PARAMETER},
	{"/windows", PARAMETER},
	{"/NOCUSTOM", PARAMETER},
	{"/CUSTOMSTRING", PARAMETER},
	{"/COMPONENTSONLYONCUSTOM", PARAMETER},
	{"hide", PARAMETER},
	{"show", PARAMETER},
	{"nevershow", PARAMETER},
	{"normal", PARAMETER},
	{"silent", PARAMETER},
	{"silentlog", PARAMETER},
	{"on", PARAMETER},
	{"off", PARAMETER},
	{"auto", PARAMETER},
	{"force", PARAMETER},
	{"zlib", PARAMETER},
	{"bzip2", PARAMETER},
	{"try", PARAMETER},
	{"ifnewer", PARAMETER},
	{"lastused", PARAMETER},
	{"manual", PARAMETER},
	{"alwaysoff", PARAMETER},
	{"/e", PARAMETER},
	{"RO", PARAMETER},
	{"/REBOOTOK", PARAMETER},
	{"/nonfatal", PARAMETER},
	{"/a", PARAMETER},
	{"/r", PARAMETER},
	{"/oname", PARAMETER},
	{"SW_SHOWNORMAL", PARAMETER},
	{"SW_SHOWMAXIMIZED", PARAMETER},
	{"SW_SHOWMINIMIZED", PARAMETER},
	{"/NOUNLOAD", PARAMETER},
	{"/SILENT", PARAMETER},
	{"/FILESONLY", PARAMETER},
	{"/SHORT", PARAMETER},
	{"MB_OK", PARAMETER},
	{"MB_OKCANCEL", PARAMETER},
	{"MB_ABORTRETRYIGNORE", PARAMETER},
	{"MB_RETRYCANCEL", PARAMETER},
	{"MB_YESNO", PARAMETER},
	{"MB_YESNOCANCEL", PARAMETER},
	{"MB_ICONEXCLAMATION", PARAMETER},
	{"MB_ICONINFORMATION", PARAMETER},
	{"MB_ICONQUESTION", PARAMETER},
	{"MB_ICONSTOP", PARAMETER},
	{"MB_TOPMOST", PARAMETER},
	{"MB_SETFOREGROUND", PARAMETER},
	{"MB_RIGHT", PARAMETER},
	{"MB_DEFBUTTON1", PARAMETER},
	{"MB_DEFBUTTON2", PARAMETER},
	{"MB_DEFBUTTON3", PARAMETER},
	{"MB_DEFBUTTON4", PARAMETER},
	{"IDABORT", PARAMETER},
	{"IDCANCEL", PARAMETER},
	{"IDIGNORE", PARAMETER},
	{"IDNO", PARAMETER},
	{"IDOK", PARAMETER},
	{"IDRETRY", PARAMETER},
	{"IDYES", PARAMETER},
	{"HKCR", PARAMETER},
	{"HKLM", PARAMETER},
	{"HKCU", PARAMETER},
	{"HKU", PARAMETER},
	{"HKCC", PARAMETER},
	{"HKDD", PARAMETER},
	{"HKPD", PARAMETER},
	{"HKEY_CLASSES_ROOT", PARAMETER},
	{"HKEY_LOCAL_MACHINE", PARAMETER},
	{"HKEY_CURRENT_USER", PARAMETER},
	{"HKEY_USERS", PARAMETER},
	{"HKEY_CURRENT_CONFIG", PARAMETER},
	{"HKEY_DYN_DATA", PARAMETER},
	{"HKEY_PERFORMANCE_DATA", PARAMETER},
	{"current", PARAMETER},
	{"all", PARAMETER},
	{"true", PARAMETER},
	{"false", PARAMETER},
	{"/TIMEOUT", PARAMETER},
	{"/IMGID", PARAMETER},
	{"/RESIZETOFIT", PARAMETER},
	{"none", PARAMETER},
	{"listonly", PARAMETER},
	{"textonly", PARAMETER},
	{"both", PARAMETER},
	{"lastused", PARAMETER},
	{"/ITALIC", PARAMETER},
	{"/UNDERLINE", PARAMETER},
	{"/STRIKE", PARAMETER},
	{"smooth", PARAMETER},
	{"/BRANDING", PARAMETER},
	{"/o", PARAMETER}
};
%}

%x SLCOMMENT STRING STRING2 STRING3 VAR PREPROCESSOR

SWC		[\.\/A-Za-z_]
WWC		[_A-Za-z0-9\.]
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
	;					BEGIN(SLCOMMENT); printf("<span class=\"ahcomment\">%s",yytext);
	#					BEGIN(SLCOMMENT); printf("<span class=\"ahcomment\">%s",yytext);
}

<INITIAL,STRING,STRING2,STRING3>{
	$\{{WORD}\}	  printf("<span class=\"ahvar\">%s</span>",yytext);
	${WWC}+				printf("<span class=\"ahvar\">%s</span>",yytext);
	$\\[rn]				printf("<span class=\"ahvar\">%s</span>",yytext);
}

<INITIAL>{
	\"					BEGIN(STRING);	printf("<span class=\"ahstring\">%s",yytext);
	\'					BEGIN(STRING2);	printf("<span class=\"ahstring\">%s",yytext);
	\`					BEGIN(STRING3); printf("<span class=\"ahstring\">%s",yytext);

	^{SPACE}!{SPACE}[a-z]+	{ //preprocessor
                printf("<span class=\"ahprepro\"><b>%s</b></span>",yytext);
								BEGIN(PREPROCESSOR);
							}

	^{SPACE}{WORD}{SPACE}:	printf("<span class=\"ahlabel\">%s</span>",yytext);

	{WORD}	{
        for(i=0,iskeyword=0; i<sizeof(keywords)/sizeof(struct keyword); i++) {
                if(strcasecmp(yytext,keywords[i].name)==0) {
                        iskeyword=1;
                        break;
		}
        }
        if(iskeyword) {
          printf("<span class=\"%s\">%s</span>",keywords[i].color,yytext);
        } else {
          ECHO;
        }
			}	

	 /* numbers */
	[a-fA-F0-9]+	printf("<span class=\"ahnumber\">%s</span>",yytext);

	{SYMB}				printf("<span class=\"ahnumber\">%s</span>",yytext);

	 /* invalid chars - all second part of the ASCII table */
	[\x80-\xFF]+	

  /*<<EOF>>       printf("</pre>"); yyterminate();*/
}

<SLCOMMENT>{
	\\{EOL}				ECHO;
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
	\\{EOL}				ECHO;
	{EOL}				BEGIN(INITIAL);   ECHO;
}

<*>{
	{WORD} |
	{SPACE}+ |
	{EOL} |
	.					  ECHO;
}
