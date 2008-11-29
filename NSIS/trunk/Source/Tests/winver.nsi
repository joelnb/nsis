####
#
#  This massive script tests WinVer's version, SP, platform and server detection.
#  It also tests comparison of version and SP with every other available version.
#
#  To make this work on one computer, a script storing the result of GetVersionEx
#  was executed on a number of different Windows versions. Using a hack in WinVer
#  this script replaces this computer's results with the ones from the script and
#  runs the tests for every stored result.
#
#  To add a test for another version, use the following script.
#
#      !include LogicLib.nsh
#
#      OutFile WinVer.exe
#      ShowInstDetails show
#
#      Function PrintSysVersion
#
#        System::Alloc $1
#        Pop $0
#        System::Call *$0(ir1)
#        System::Call kernel32::GetVersionEx(ir0)i.R0
#
#        DetailPrint 'StrCpy $2_RES $R0'
#
#        System::Call '*$0(i.R0,i.R1,i.R2,i.R3,i.R4,&t128.R5,&i2.R6,&i2.R7,&i2.R8,&i1.R9,&i1)'
#        DetailPrint 'StrCpy $2_CSD "$R5"'
#        DetailPrint 'StrCpy $2_INIT "i $R0, i $R1, i $R2, i $R3, i $R4, &t128 s, &i2 $R6, &i2 $R7, &i2 $R8, &i1 $R9, &i1 0"'
#
#        StrCpy $R0 $0
#        IntOp $R1 $R0 + $1
#        IntOp $R1 $R1 - 1
#        StrCpy $R3 '# '
#
#        ${For} $R2 $R0 $R1
#
#          System::Call *$R2(&i1.R4)
#          IntFmt $R4 %02x $R4
#          StrCpy $R3 $R3$R4
#
#        ${Next}
#
#        DetailPrint $R3
#
#        System::Free $0
#
#      FunctionEnd
#
#      Section
#
#        DetailPrint "# OSVERSIONINFOEX"
#
#        StrCpy $1 156
#        StrCpy $2 "$$OSVERSIONINFOEX"
#        Call PrintSysVersion
#
#        DetailPrint ""
#
#        DetailPrint "# OSVERSIONINFO"
#
#        StrCpy $1 148
#        StrCpy $2 "$$OSVERSIONINFO"
#        Call PrintSysVersion
#
#      SectionEnd
#
#
#  EXPECTED RESULTS
#
#      SUCCESS Windows 95 OSR B
#      SUCCESS Windows 98
#      SUCCESS Windows ME
#      Server detection failed for Windows NT4 SP1
#         Expected: server
#         Got: client
#      FAILURE Windows NT4 SP1
#      SUCCESS Windows NT4 SP6
#      SUCCESS Windows 2000
#      SUCCESS Windows 2000 SP4
#      SUCCESS Windows XP SP2
#      SUCCESS Windows XP SP3
#      SUCCESS Windows XP x64 SP1
#      SUCCESS Windows Vista
#      SUCCESS Windows Server 2008
#      Completed
#
#  FAILURES
#
#    * On NT4 below SP6, the registry has to be checked to figure out if it's
#      a server or not. WinVer doesn't do that yet.
#
#
####

Name winver
OutFile winver.exe

XPStyle on
ShowInstDetails show

Var OSVERSIONINFO_RES
Var OSVERSIONINFO_CSD
Var OSVERSIONINFO_INIT
Var OSVERSIONINFOEX_RES
Var OSVERSIONINFOEX_CSD
Var OSVERSIONINFOEX_INIT

!macro __WinVer_Call_GetVersionEx STRUCT_SIZE

	!if ${STRUCT_SIZE} == ${OSVERSIONINFOA_SIZE}

		StrCpy $3 $OSVERSIONINFO_RES
		Push $OSVERSIONINFO_CSD
		System::Call '*$0($OSVERSIONINFO_INIT)'

	!endif

	!if ${STRUCT_SIZE} == ${OSVERSIONINFOEXA_SIZE}

		StrCpy $3 $OSVERSIONINFOEX_RES
		Push $OSVERSIONINFOEX_CSD
		System::Call '*$0($OSVERSIONINFOEX_INIT)'

	!endif

!macroend

!include WinVer.nsh
!insertmacro __WinVer_DeclareVars

!macro TestWinVerDiff NAME VER V_

	!if ${VER} != ${V_}

		${If} ${IsWin${V_}}

			DetailPrint "Version detection failed for ${NAME}"
			DetailPrint "   Expected: ${VER}"
			DetailPrint "   Got: ${V_}"

			StrCpy $R0 "FAILURE"

		${EndIf}

	!endif

!macroend

!define ORDER_95    0
!define ORDER_NT4   0
!define ORDER_98    1
!define ORDER_ME    2
!define ORDER_2000  3
!define ORDER_XP    4
!define ORDER_2003  5
!define ORDER_Vista 6
!define ORDER_2008  7

!macro TestWinVerOrder NAME VER V_

	!if ${ORDER_${VER}} >= ${ORDER_${V_}}

		${IfNot} ${AtLeastWin${V_}}

			DetailPrint "Version comparison failed for ${NAME}"
			DetailPrint "   Expected: ${VER} >= ${V_}"
			DetailPrint "   Got: ${VER} < ${V_}"

			StrCpy $R0 "FAILURE"

		${EndIf}

	!endif

	!if ${ORDER_${VER}} <= ${ORDER_${V_}}

		${IfNot} ${AtMostWin${V_}}

			DetailPrint "Version comparison failed for ${NAME}"
			DetailPrint "   Expected: ${VER} <= ${V_}"
			DetailPrint "   Got: ${VER} > ${V_}"

			StrCpy $R0 "FAILURE"

		${EndIf}

	!endif

!macroend

!macro TestWinVer NAME VER SP SERVER PLATFORM

	StrCpy $R0 "SUCCESS"

	StrCpy $__WINVERV ""
	StrCpy $__WINVERSP ""

	# test version equality

	${IfNot} ${IsWin${VER}}
	${OrIfNot} ${AtLeastWin${VER}}
	${OrIfNot} ${AtMostWin${VER}}

		DetailPrint "Version detection failed for ${NAME}"

		StrCpy $R0 "FAILURE"

	${EndIf}

	!insertmacro TestWinVerDiff "${NAME}" ${VER} 95
	!insertmacro TestWinVerDiff "${NAME}" ${VER} 98
	!insertmacro TestWinVerDiff "${NAME}" ${VER} ME
	!insertmacro TestWinVerDiff "${NAME}" ${VER} NT4
	!insertmacro TestWinVerDiff "${NAME}" ${VER} 2000
	!insertmacro TestWinVerDiff "${NAME}" ${VER} XP
	!insertmacro TestWinVerDiff "${NAME}" ${VER} 2003
	!insertmacro TestWinVerDiff "${NAME}" ${VER} Vista
	!insertmacro TestWinVerDiff "${NAME}" ${VER} 2008

	# test version comparison

	!insertmacro TestWinVerOrder "${NAME}" ${VER} 95
	!insertmacro TestWinVerOrder "${NAME}" ${VER} 98
	!insertmacro TestWinVerOrder "${NAME}" ${VER} ME
	!insertmacro TestWinVerOrder "${NAME}" ${VER} NT4
	!insertmacro TestWinVerOrder "${NAME}" ${VER} 2000
	!insertmacro TestWinVerOrder "${NAME}" ${VER} XP
	!insertmacro TestWinVerOrder "${NAME}" ${VER} 2003
	!insertmacro TestWinVerOrder "${NAME}" ${VER} Vista
	!insertmacro TestWinVerOrder "${NAME}" ${VER} 2008

	# test service pack equality

	IntOp $0 ${SP} - 1
	IntOp $1 ${SP} + 1

	${IfNot} ${IsServicePack} ${SP}
	${OrIf} ${IsServicePack} $0
	${OrIf} ${IsServicePack} $1

		!insertmacro _WinVer_GetServicePackLevel

		DetailPrint "Service pack detection failed for ${NAME}"
		DetailPrint "   Expected: ${SP}"
		DetailPrint "   Got: $_LOGICLIB_TEMP"

		StrCpy $R0 "FAILURE"

	${EndIf}

	# test service pack comparison

	${IfNot} ${AtLeastServicePack} ${SP}
	${OrIfNot} ${AtLeastServicePack} $0
	${OrIfNot} ${AtMostServicePack} ${SP}
	${OrIfNot} ${AtMostServicePack} $1

		DetailPrint "Service pack comparison failed for ${NAME}"

		StrCpy $R0 "FAILURE"

	${EndIf}

	# test server detection

	StrCpy $0 "client"
	${If} ${IsServerOS}
		StrCpy $0 "server"
	${EndIf}

	${If} ${SERVER} != $0

		DetailPrint "Server detection failed for ${NAME}"
		DetailPrint "   Expected: ${SERVER}"
		DetailPrint "   Got: $0"

		StrCpy $R0 "FAILURE"

	${EndIf}

	# test platform

	StrCpy $0 "9x"
	${If} ${IsNT}
		StrCpy $0 "nt"
	${EndIf}

	${If} ${PLATFORM} != $0

		DetailPrint "Platform detection failed for ${NAME}"
		DetailPrint "   Expected: ${PLATFORM}"
		DetailPrint "   Got: $0"

		StrCpy $R0 "FAILURE"

	${EndIf}

	DetailPrint "$R0 ${NAME}"

!macroend

###############################################################
###############################################################
###############################################################

Section

	#### WINDOWS 95 OSR B [4.00.950 B]

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 0
	StrCpy $OSVERSIONINFOEX_CSD ""
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 0, i 0, i 0, i 0, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 9c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD " B"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 4, i 0, i 67109975, i 1, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 94000000040000000000000057040004010000002042000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows 95 OSR B" 95 2 client 9x

	#### WINDOWS 98

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 0
	StrCpy $OSVERSIONINFOEX_CSD ""
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 0, i 0, i 0, i 0, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 9c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD " "
	StrCpy $OSVERSIONINFO_INIT "i 148, i 4, i 10, i 67766222, i 1, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 94000000040000000a000000ce070a04010000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows 98" 98 0 client 9x

	#### WINDOWS ME

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD " "
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 4, i 90, i 73010104, i 1, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 9c000000040000005a000000b80b5a040100000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD " "
	StrCpy $OSVERSIONINFO_INIT "i 148, i 4, i 90, i 73010104, i 1, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 94000000040000005a000000b80b5a04010000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows ME" ME 0 client 9x

	#### WINDOWS NT4 SP1

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 0
	StrCpy $OSVERSIONINFOEX_CSD ""
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 0, i 0, i 0, i 0, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 9c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 1"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 4, i 0, i 1381, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000400000000000000650500000200000053657276696365205061636b2031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows NT4 SP1" NT4 1 server nt

	#### WINDOWS NT4 SP6

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD "Service Pack 6"
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 4, i 0, i 1381, i 2, &t128s, &i2 6, &i2 0, &i2 0, &i1 3, &i1 0"
	# 9c0000000400000000000000650500000200000053657276696365205061636b20360000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000300

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 6"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 4, i 0, i 1381, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000400000000000000650500000200000053657276696365205061636b2036000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows NT4 SP6" NT4 6 server nt

	#### WINDOWS 2000 SP0

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD ""
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 5, i 0, i 2195, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 1, &i1 0"
	# 9c0000000500000000000000930800000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD ""
	StrCpy $OSVERSIONINFO_INIT "i 148, i 5, i 0, i 2195, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 94000000050000000000000093080000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows 2000" 2000 0 client nt

	#### WINDOWS 2000 SP4

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD "Service Pack 4"
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 5, i 0, i 2195, i 2, &t128s, &i2 4, &i2 0, &i2 0, &i1 1, &i1 0"
	# 9c0000000500000000000000930800000200000053657276696365205061636b20340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000100

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 4"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 5, i 0, i 2195, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000500000000000000930800000200000053657276696365205061636b2034000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows 2000 SP4" 2000 4 client nt

	#### WINDOWS XP SP2

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD "Service Pack 2"
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 5, i 1, i 2600, i 2, &t128s, &i2 2, &i2 0, &i2 256, &i1 1, &i1 0"
	# 9c0000000500000001000000280a00000200000053657276696365205061636b20320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000010100

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 2"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 5, i 1, i 2600, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000500000001000000280a00000200000053657276696365205061636b2032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows XP SP2" XP 2 client nt

	#### WINDOWS XP SP3

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD "Service Pack 3"
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 5, i 1, i 2600, i 2, &t128s, &i2 3, &i2 0, &i2 256, &i1 1, &i1 0"
	# 9c0000000500000001000000280a00000200000053657276696365205061636b20330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000000010100

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 3"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 5, i 1, i 2600, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000500000001000000280a00000200000053657276696365205061636b2033000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows XP SP3" XP 3 client nt

	#### WINDOWS XP x64 SP1

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD "Service Pack 1"
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 5, i 2, i 3790, i 2, &t128s, &i2 1, &i2 0, &i2 256, &i1 1, &i1 0"
	# 9c0000000500000002000000ce0e00000200000053657276696365205061636b2031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000001011e

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 1"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 5, i 2, i 3790, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000500000002000000ce0e00000200000053657276696365205061636b2031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows XP x64 SP1" XP 1 client nt

	#### WINDOWS VISTA SP0

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD ""
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 6, i 0, i 6000, i 2, &t128s, &i2 0, &i2 0, &i2 256, &i1 1, &i1 0"
	# 9c0000000600000000000000701700000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD ""
	StrCpy $OSVERSIONINFO_INIT "i 148, i 6, i 0, i 6000, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 94000000060000000000000070170000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows Vista" Vista 0 client nt

	#### WINDOWS 2008 SERVER SP1

	# OSVERSIONINFOEX
	StrCpy $OSVERSIONINFOEX_RES 1
	StrCpy $OSVERSIONINFOEX_CSD "Service Pack 1"
	StrCpy $OSVERSIONINFOEX_INIT "i 156, i 6, i 0, i 6001, i 2, &t128s, &i2 1, &i2 0, &i2 272, &i1 3, &i1 0"
	# 9c0000000600000000000000711700000200000053657276696365205061636b2031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000001001031e

	# OSVERSIONINFO
	StrCpy $OSVERSIONINFO_RES 1
	StrCpy $OSVERSIONINFO_CSD "Service Pack 1"
	StrCpy $OSVERSIONINFO_INIT "i 148, i 6, i 0, i 6001, i 2, &t128s, &i2 0, &i2 0, &i2 0, &i1 0, &i1 0"
	# 940000000600000000000000711700000200000053657276696365205061636b2031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

	!insertmacro TestWinVer "Windows Server 2008" 2008 1 server nt

SectionEnd
