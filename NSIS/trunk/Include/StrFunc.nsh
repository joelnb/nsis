/*

Functions Header File for NSIS

StrFunc.nsh
This file contains functions for string manipulation for NSIS

by Diego Pedroso (aka deguix)

*/

!ifndef MUI_VERBOSE
  !define MUI_VERBOSE 3
!endif

!echo `$\r$\n----------------------------------------------------------------------$\r$\nNSIS String Functions Header File 1.06 - � 2004 Diego Pedroso$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

!define StrCase `!insertmacro FUNCTION_STRING_StrCase`
!define StrClbGet `!insertmacro FUNCTION_STRING_StrClbGet`
!define StrClbSet `!insertmacro FUNCTION_STRING_StrClbSet`
!define StrIOToNSIS `!insertmacro FUNCTION_STRING_StrIOToNSIS`
!define StrLoc `!insertmacro FUNCTION_STRING_StrLoc`
!define StrNSISToIO `!insertmacro FUNCTION_STRING_StrNSISToIO`
!define StrRep `!insertmacro FUNCTION_STRING_StrRep`
!define StrSort `!insertmacro FUNCTION_STRING_StrSort`
!define StrStr `!insertmacro FUNCTION_STRING_StrStr`
!define StrStrAdv `!insertmacro FUNCTION_STRING_StrStrAdv`
!define StrTok `!insertmacro FUNCTION_STRING_StrTok`
!define StrTrimNewLines `!insertmacro FUNCTION_STRING_StrTrimNewLines`

!define UnStrFunc `!insertmacro FUNCTION_STRING_UninstSupport`

!macro FUNCTION_STRING_UninstSupport

  !define FUNCTION_STRING_UninstSupport

  !define UnStrCase `!insertmacro FUNCTION_STRING_StrCase`
  !define UnStrClbGet `!insertmacro FUNCTION_STRING_StrClbGet`
  !define UnStrClbSet `!insertmacro FUNCTION_STRING_StrClbSet`
  !define UnStrIOToNSIS `!insertmacro FUNCTION_STRING_StrIOToNSIS`
  !define UnStrLoc `!insertmacro FUNCTION_STRING_StrLoc`
  !define UnStrNSISToIO `!insertmacro FUNCTION_STRING_StrNSISToIO`
  !define UnStrRep `!insertmacro FUNCTION_STRING_StrRep`
  !define UnStrSort `!insertmacro FUNCTION_STRING_StrSort`
  !define UnStrStr `!insertmacro FUNCTION_STRING_StrStr`
  !define UnStrStrAdv `!insertmacro FUNCTION_STRING_StrStrAdv`
  !define UnStrTok `!insertmacro FUNCTION_STRING_StrTok`
  !define UnStrTrimNewLines `!insertmacro FUNCTION_STRING_StrTrimNewLines`

!macroend

# Function StrCase
################

!macro FUNCTION_STRING_StrCase

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nChange Case String Function - � 2004 Diego Pedroso$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrCase
    !define UnStrCase `!insertmacro FUNCTION_STRING_UnStrCase_Call`
    Function un.StrCase
  !else
    !undef StrCase
    !define StrCase `!insertmacro FUNCTION_STRING_StrCase_Call`
    Function StrCase
  !endif

    Exch $R0
    Exch
    Exch $R1
    Push $R2
    Push $R3
    Push $R4
    Push $R5
    Push $R6


    StrCpy $R2 ""
    StrCpy $R3 ""
    StrCpy $R4 ""
    StrCpy $R5 ""
    StrCpy $R6 ""

    StrCmp $R0 `Upper Case` +5
    StrCmp $R0 `Lower Case` +4
    StrCmp $R0 `Title Case` +3
    StrCmp $R0 `Sentence Case` +2
      StrCpy $R0 `Sentence Case`

    loop:
      StrCpy $R2 $R1 1
      StrCmp $R2 `` done
      StrCpy $R1 $R1 `` 1

      StrCmp $R0 `Upper Case` 0 +2
        StrCpy $R3 65

      StrCmp $R0 `Lower Case` 0 +2
        StrCpy $R3 97

      StrCmp $R0 `Title Case` 0 +6
        StrCmp $R6 ` ` +2
        StrCmp $R6 `` 0 +3
          StrCpy $R3 65
          Goto +2
        StrCpy $R3 97

      StrCmp $R0 `Sentence Case` 0 +8
        StrCmp $R6 `.` +4
        StrCmp $R6 `!` +3
        StrCmp $R6 `?` +2
        StrCmp $R6 `` 0 +3
          StrCpy $R3 65
          Goto +2
        StrCpy $R3 97

      loop2:

        IntFmt $R4 %c $R3

        StrCmp $R2 $R4 0 +10
          StrCpy $R5 $R5$R4

          StrCmp $R0 `Sentence Case` 0 loop
            StrCmp $R2 ` ` 0 +5
              StrCmp $R6 `` +5
              StrCmp $R6 `.` +4
              StrCmp $R6 `!` +3
              StrCmp $R6 `?` +2

          StrCpy $R6 $R2
          Goto loop

        IntOp $R3 $R3 + 1

        StrCmp $R0 `Upper Case` 0 +3
          StrCpy $R4 91
          Goto +3
        StrCmp $R0 `Lower Case` 0 +2
          StrCpy $R4 123

        StrCmp $R0 `Title Case` 0 +6
          StrCmp $R6 ` ` +2
          StrCmp $R6 `` 0 +3
            StrCpy $R4 91
            Goto +2
          StrCpy $R4 123

        StrCmp $R0 `Sentence Case` 0 +8
          StrCmp $R6 `.` +4
          StrCmp $R6 `!` +3
          StrCmp $R6 `?` +2
          StrCmp $R6 `` 0 +3
            StrCpy $R4 97
            Goto +2
          StrCpy $R4 123

        StrCmp $R0 `Sentence Case` +2
          StrCpy $R6 $R2

        StrCmp $R3 $R4 0 Loop2
        StrCpy $R5 $R5$R2

        StrCmp $R0 `Sentence Case` 0 +6
          StrCmp $R2 ` ` 0 +5
            StrCmp $R6 `` +5
            StrCmp $R6 `.` +4
            StrCmp $R6 `!` +3
            StrCmp $R6 `?` +2

        StrCpy $R6 $R2

        Goto loop

    done:
    StrCpy $R0 $R5

    Pop $R6
    Pop $R5
    Pop $R4
    Pop $R3
    Pop $R2
    Pop $R1
    Exch $R0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrCase_Call ResultVar String Type

  !echo `$ {StrCase} "${ResultVar}" "${String}" "${Type}"$\r$\n`

  Push `${String}`
  Push `${Type}`

  Call StrCase

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrCase_Call ResultVar String Type

  !echo `$ {UnStrCase} "${ResultVar}" "${String}" "${Type}"$\r$\n`

  Push `${String}`
  Push `${Type}`

  Call un.StrCase

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_StrClbGet

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nCopy From Clipboard Function - 2003-2004 Nik Medved - changed by Diego Pedroso$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrClbGet
    !define UnStrClbGet `!insertmacro FUNCTION_STRING_UnStrClb_Get`
    Function un.CopyFromClipboard
  !else
    !undef StrClbGet
    !define StrClbGet `!insertmacro FUNCTION_STRING_StrClb_Get`
    Function CopyFromClipboard
  !endif

    Push $0
    System::Call 'user32::OpenClipboard(i 0)'
    System::Call 'user32::GetClipboardData(i 1) t .r0'
    System::Call 'user32::CloseClipboard()'
    Exch $0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrClb_Get ResultVar

  !echo `$ {StrClbGet} "${ResultVar}"$\r$\n`

  Call CopyFromClipboard

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrClb_Get ResultVar

  !echo `$ {UnStrClbGet} "${ResultVar}"$\r$\n`

  Call un.CopyFromClipboard

  Pop `${ResultVar}`

!macroend

# Function StrClbSet
##################

!macro FUNCTION_STRING_StrClbSet

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nCopy To Clipboard - 2003-2004 Nik Medved$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrClbSet
    !define UnStrClbSet `!insertmacro FUNCTION_STRING_UnStrClb_Set`
    Function un.CopyToClipboard
  !else
    !undef StrClbSet
    !define StrClbSet `!insertmacro FUNCTION_STRING_StrClb_Set`
    Function CopyToClipboard
  !endif

    Exch $0 ;input string
    Push $1
    Push $2
    System::Call 'user32::OpenClipboard(i 0)'
    System::Call 'user32::EmptyClipboard()'
    StrLen $1 $0
    IntOp $1 $1 + 1
    System::Call 'kernel32::GlobalAlloc(i 2, i r1) i.r1'
    System::Call 'kernel32::GlobalLock(i r1) i.r2'
    System::Call 'kernel32::lstrcpyA(i r2, t r0)'
    System::Call 'kernel32::GlobalUnlock(i r1)'
    System::Call 'user32::SetClipboardData(i 1, i r1)'
    System::Call 'user32::CloseClipboard()'
    Pop $2
    Pop $1
    Pop $0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrClb_Set String

  !echo `$ {StrClbSet} "${String}"$\r$\n`

  Push `${String}`

  Call CopyToClipboard

!macroend

!macro FUNCTION_STRING_UnStrClb_Set String

  !echo `$ {UnStrClbSet} "${String}"$\r$\n`

  Push `${String}`

  Call un.CopyToClipboard

!macroend

# Function StrIOToNSIS
####################

!macro FUNCTION_STRING_StrIOToNSIS

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nInstall Options -> NSIS String Convertion Function - 2003-2004 Amir Szekely, Joost Verburg and Dave Laundon$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrIOToNSIS
    !define UnStrIOToNSIS `!insertmacro FUNCTION_STRING_UnStrIOToNSIS_Call`
    Function un.Io2Nsis
  !else
    !undef StrIOToNSIS
    !define StrIOToNSIS `!insertmacro FUNCTION_STRING_StrIOToNSIS_Call`
    Function Io2Nsis
  !endif

    Exch $0 ; The source
    Push $1 ; The output
    Push $2 ; Temporary char
    StrCpy $1 `` ; Initialise the output
  loop:
    StrCpy $2 $0 1 ; Get the next source char
    StrCmp $2 `` done ; Abort when none left
      StrCpy $0 $0 `` 1 ; Remove it from the source
      StrCmp $2 `\` +3 ; Escape character?
        StrCpy $1 `$1$2` ; If not just output
        Goto loop
      StrCpy $2 $0 1 ; Get the next source char
      StrCpy $0 $0 `` 1 ; Remove it from the source
      StrCmp $2 `\` `` +3 ; Back-slash?
        StrCpy $1 `$1\`
        Goto loop
      StrCmp $2 `r` `` +3 ; Carriage return?
        StrCpy $1 `$1$\r`
        Goto loop
      StrCmp $2 `n` `` +3 ; Line feed?
        StrCpy $1 `$1$\n`
        Goto loop
      StrCmp $2 `t` `` +3 ; Tab?
        StrCpy $1 `$1$\t`
        Goto loop
      StrCpy $1 `$1$2` ; Anything else (should never get here)
      Goto loop
  done:
    StrCpy $0 $1
    Pop $2
    Pop $1
    Exch $0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrIOToNSIS_Call ResultVar String

  !echo `$ {StrIOToNSIS} "${ResultVar}" "${String}"$\r$\n`

  Push `${String}`

  Call IO2NSIS

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrIOToNSIS_Call ResultVar String

  !echo `$ {UnStrIOToNSIS} "${ResultVar}" "${String}"$\r$\n`

  Push `${String}`

  Call un.IO2NSIS

  Pop `${ResultVar}`

!macroend

# Function StrLoc
###############

!macro FUNCTION_STRING_StrLoc

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nLocalize in String Function - � 2004 Diego Pedroso\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrLoc
    !define UnStrLoc `!insertmacro FUNCTION_STRING_UnStrLoc_Call`
    Function un.StrLoc
  !else
    !undef StrLoc
    !define StrLoc `!insertmacro FUNCTION_STRING_StrLoc_Call`
    Function StrLoc
  !endif

    Exch $R0
    Exch
    Exch $R1 ; st=haystack,old$R1, $R1=needle
    Exch 2    ; st=old$R1,haystack
    Exch $R2 ; st=old$R1,old$R2, $R2=haystack
    Push $R3
    Push $R4
    Push $R5
    StrLen $R3 $R1
    StrCpy $R4 0
    loop:
      StrCpy $R5 $R2 $R3 $R4
      StrCmp $R5 $R1 done
      StrCmp $R5 `` error
      IntOp $R4 $R4 + 1
      Goto loop
    done:

    StrCmp $R0 `<` 0 +5
      StrLen $R0 $R2
      IntOp $R5 $R3 + $R4
      IntOp $R0 $R0 - $R5
      Goto +2

    StrCpy $R0 $R4
    Goto +2

    error:
    StrCpy $R0 ``

    Pop $R5
    Pop $R4
    Pop $R3
    Pop $R2
    Exch
    Pop $R1
    Exch $R0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrLoc_Call ResultVar String StrToSearchFor OffsetDirection

  !echo `$ {StrLoc} "${ResultVar}" "${String}" "${StrToSearchFor}" "${OffsetDirection}"$\r$\n`

  Push `${String}`
  Push `${StrToSearchFor}`
  Push `${OffsetDirection}`

  Call StrLoc

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrLoc_Call ResultVar String StrToSearchFor OffsetDirection

  !echo `$ {UnStrLoc} "${ResultVar}" "${String}" "${StrToSearchFor}" "${OffsetDirection}"$\r$\n`

  Push `${String}`
  Push `${StrToSearchFor}`
  Push `${OffsetDirection}`

  Call un.StrLoc

  Pop `${ResultVar}`

!macroend

# Function StrNSISToIO
####################

!macro FUNCTION_STRING_StrNSISToIO

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nNSIS -> Install Options String Convertion Function - 2003-2004 Amir Szekely, Joost Verburg and Dave Laundon$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrNSISToIO
    !define UnStrNSISToIO `!insertmacro FUNCTION_STRING_UnStrNSISToIO_Call`
    Function un.Nsis2Io
  !else
    !undef StrNSISToIO
    !define StrNSISToIO `!insertmacro FUNCTION_STRING_StrNSISToIO_Call`
    Function Nsis2Io
  !endif

    Exch $0 ; The source
    Push $1 ; The output
    Push $2 ; Temporary char
    StrCpy $1 `` ; Initialise the output
  loop:
    StrCpy $2 $0 1 ; Get the next source char
    StrCmp $2 `` done ; Abort when none left
      StrCpy $0 $0 `` 1 ; Remove it from the source
      StrCmp $2 `\` `` +3 ; Back-slash?
        StrCpy $1 `$1\\`
        Goto loop
      StrCmp $2 `$\r` `` +3 ; Carriage return?
        StrCpy $1 `$1\r`
        Goto loop
      StrCmp $2 `$\n` `` +3 ; Line feed?
        StrCpy $1 `$1\n`
        Goto loop
      StrCmp $2 `$\t` `` +3 ; Tab?
        StrCpy $1 `$1\t`
        Goto loop
      StrCpy $1 `$1$2` ; Anything else
      Goto loop
  done:
    StrCpy $0 $1
    Pop $2
    Pop $1
    Exch $0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrNSISToIO_Call ResultVar String

  !echo `$ {StrNSISToIO} "${ResultVar}" "${String}"$\r$\n`

  Push `${String}`

  Call NSIS2IO

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrNSISToIO_Call ResultVar String

  !echo `$ {UnStrNSISToIO} "${ResultVar}" "${String}"$\r$\n`

  Push `${String}`

  Call un.NSIS2IO

  Pop `${ResultVar}`

!macroend

# Function StrRep
###############

!macro FUNCTION_STRING_StrRep

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nReplace String Function - 2002-2004 Hendri Adriaens$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrRep
    !define UnStrRep `!insertmacro FUNCTION_STRING_UnStrRep_Call`
    Function un.StrReplace
  !else
    !undef StrRep
    !define StrRep `!insertmacro FUNCTION_STRING_StrRep_Call`
    Function StrReplace
  !endif

    Exch $0 ;this will replace wrong characters
    Exch
    Exch $1 ;needs to be replaced
    Exch
    Exch 2
    Exch $2 ;the orginal string
    Push $3 ;counter
    Push $4 ;temp character
    Push $5 ;temp string
    Push $6 ;length of string that need to be replaced
    Push $7 ;length of string that will replace
    Push $R0 ;tempstring
    Push $R1 ;tempstring
    Push $R2 ;tempstring
    StrCpy $3 `-1`
    StrCpy $5 ``
    StrLen $6 $1
    StrLen $7 $0
    Loop:
    IntOp $3 $3 + 1
    StrCpy $4 $2 $6 $3
    StrCmp $4 `` ExitLoop
    StrCmp $4 $1 Replace
    Goto Loop
    Replace:
    StrCpy $R0 $2 $3
    IntOp $R2 $3 + $6
    StrCpy $R1 $2 `` $R2
    StrCpy $2 $R0$0$R1
    IntOp $3 $3 + $7
    Goto Loop
    ExitLoop:
    StrCpy $0 $2
    Pop $R2
    Pop $R1
    Pop $R0
    Pop $7
    Pop $6
    Pop $5
    Pop $4
    Pop $3
    Pop $2
    Pop $1
    Exch $0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrRep_Call ResultVar String StringToReplace ReplacementString

  !echo `$ {StrRep} "${ResultVar}" "${String}" "${StringToReplace}" "${ReplacementString}"$\r$\n`

  Push `${String}`
  Push `${StringToReplace}`
  Push `${ReplacementString}`

  Call StrReplace

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrRep_Call ResultVar String StringToReplace ReplacementString

  !echo `$ {UnStrRep} "${ResultVar}" "${String}" "${StringToReplace}" "${ReplacementString}"$\r$\n`

  Push `${String}`
  Push `${StringToReplace}`
  Push `${ReplacementString}`

  Call un.StrReplace

  Pop `${ResultVar}`

!macroend

# Function StrSort
################

!macro FUNCTION_STRING_StrSort

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nAdvanced String Sort Function - � 2004 Diego Pedroso$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrSort
    !define UnStrSort `!insertmacro FUNCTION_STRING_UnStrSort_Call`
    Function un.AdvStrSort
  !else
    !undef StrSort
    !define StrSort `!insertmacro FUNCTION_STRING_StrSort_Call`
    Function AdvStrSort
  !endif

    # Prepare Variables

    Exch $R7 ;Include Center string
    Exch
    Exch $R6 ;Include Left and Right strings
    Exch 2
    Exch $0 ;Right String
    Exch 3
    Exch $1 ;Left String
    Exch 4
    Exch $2 ;Center String
    Exch 5
    Exch $R0 ;String
    Push $3
    Push $4
    Push $5
    Push $R1
    Push $R2
    Push $R3
    Push $R4
    Push $R5

    StrLen $3 $0
    StrLen $4 $1
    StrLen $5 $2
    StrCpy $R1 0

    # Center String Search

    loop:
      StrCpy $R3 $R0 $5 $R1
      StrCmp $R3 `` error
        StrCmp $R3 $2 done
          IntOp $R1 $R1 + 1
          Goto loop
    done:

    StrCpy $R5 $R1

    IntOp $R1 $R1 - $4

    # Left String Search

    loop2:
      StrCpy $R3 $R0 $4 $R1
      StrCmp $R3 `` error2
        StrCmp $R3 $1 done2
          IntOp $R1 $R1 - 1
          Goto loop2

      error2:
      StrCpy $R1 0
      StrCpy $R3 0
      Goto +2

    done2:
    StrCpy $R3 1

    StrCpy $R4 $R0 $R5

    StrCmp $R1 0 +2
      StrCpy $R4 $R4 `` $R1

    StrCmp $R3 1 0 +3
      StrCmp $R6 0 0 +2
        StrCpy $R4 $R4 `` $4

    # Center String Addition

    StrCmp $R7 0 +2
      StrCpy $R4 $R4$2

    StrCpy $R1 $R5
    IntOp $R1 $R1 + $5

    # Right String Search

    loop3:

      StrCpy $R3 $R0 $3 $R1
      StrCmp $R3 `` error3
        StrCmp $R3 $0 done3
          IntOp $R1 $R1 + 1
          Goto loop3

      error3:
      StrCpy $R1 0

    done3:

    IntOp $R5 $R5 + $5
    StrCpy $R3 $R0 `` $R5

    StrCmp $R1 0 +5
      IntOp $R1 $R1 - $R5
      StrCmp $R6 0 +2
        IntOp $R1 $R1 + $3
      StrCpy $R3 $R3 $R1

    StrCpy $R4 $R4$R3

    StrCpy $2 $R4
    Goto +2

      Error:
      StrCpy $2 ``

    # Return to User

    Pop $R5
    Pop $R4
    Pop $R3
    Pop $R2
    Pop $R1
    Pop $5
    Pop $4
    Pop $3
    Pop $R0
    Pop $R7
    Pop $R6
    Pop $0
    Pop $1
    Exch $2

  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrSort_Call ResultVar String CenterStr LeftStr RightStr IncludeLeftRightStr IncludeCenterStr

  !echo `$ {StrSort} "${ResultVar}" "${String}" "${CenterStr}" "${LeftStr}" "${RightStr}" "${IncludeLeftRightStr}" "${IncludeCenterStr}"$\r$\n`

  Push `${String}`
  Push `${CenterStr}`
  Push `${LeftStr}`
  Push `${RightStr}`
  Push `${IncludeLeftRightStr}`
  Push `${IncludeCenterStr}`

  Call AdvStrSort

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrSort_Call ResultVar String CenterStr LeftStr RightStr IncludeLeftRightStr IncludeCenterStr

  !echo `$ {UnStrSort} "${ResultVar}" "${String}" "${CenterStr}" "${LeftStr}" "${RightStr}" "${IncludeLeftRightStr}" "${IncludeCenterStr}"$\r$\n`

  Push `${String}`
  Push `${CenterStr}`
  Push `${LeftStr}`
  Push `${RightStr}`
  Push `${IncludeLeftRightStr}`
  Push `${IncludeCenterStr}`

  Call un.AdvStrSort

  Pop `${ResultVar}`

!macroend

# Function StrStr
###############

!macro FUNCTION_STRING_StrStr

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nSearch in String Function - 2002-2004 Ximon Eighteen\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrStr
    !define UnStrStr `!insertmacro FUNCTION_STRING_UnStrStr_Call`
    Function un.StrStr
  !else
    !undef StrStr
    !define StrStr `!insertmacro FUNCTION_STRING_StrStr_Call`
    Function StrStr
  !endif
    
    Exch $R1 ; st=haystack,old$R1, $R1=needle
    Exch    ; st=old$R1,haystack
    Exch $R2 ; st=old$R1,old$R2, $R2=haystack
    Push $R3
    Push $R4
    Push $R5
    StrLen $R3 $R1
    StrCpy $R4 0
    ; $R1=needle
    ; $R2=haystack
    ; $R3=len(needle)
    ; $R4=cnt
    ; $R5=tmp
    loop:
      StrCpy $R5 $R2 $R3 $R4
      StrCmp $R5 $R1 done
      StrCmp $R5 `` done
      IntOp $R4 $R4 + 1
      Goto loop
    done:
    StrCpy $R1 $R2 `` $R4
    Pop $R5
    Pop $R4
    Pop $R3
    Pop $R2
    Exch $R1
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrStr_Call ResultVar String StrToSearchFor

  !echo `$ {StrStr} "${ResultVar}" "${String}" "${StrToSearchFor}"$\r$\n`

  Push `${String}`
  Push `${StrToSearchFor}`

  Call StrStr

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrStr_Call ResultVar String StrToSearchFor

  !echo `$ {UnStrStr} "${ResultVar}" "${String}" "${StrToSearchFor}"$\r$\n`

  Push `${String}`
  Push `${StrToSearchFor}`

  Call un.StrStr

  Pop `${ResultVar}`

!macroend

# Function StrStrAdv
##################

!macro FUNCTION_STRING_StrStrAdv

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nAdvanced Search in String Function - � 2003-2004 Diego Pedroso$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrStrAdv
    !define UnStrStrAdv `!insertmacro FUNCTION_STRING_UnStrStrAdv_Call`
    Function un.AdvancedStrStr
  !else
    !undef StrStrAdv
    !define StrStrAdv `!insertmacro FUNCTION_STRING_StrStrAdv_Call`
    Function AdvancedStrStr
  !endif

   # Preparing Variables

   Exch $R9
   Exch
   Exch $R8
   Exch
   Exch 2
   Exch $R7
   Exch 2
   Exch 3
   Exch $R6
   Exch 3
   Exch 4
   Exch $R5
   Exch 4
   Exch 5
   Exch $R4
   Exch 5
   Push $R3
   Push $R2
   Push $R1
   Push $R0
   Push $9
   Push $8
   Push $7
   Push $6
   StrCpy $R2 $R4
   StrCpy $R1 $R5
   StrCpy $R4 ``
   StrCpy $R5 ``
   StrCpy $7 $R2

   StrCpy $6 ""

   # Detect Empty Input

   StrCmp $R1 `` 0 +3
     SetErrors
     Goto granddone

   StrCmp $R2 `` 0 +3
     SetErrors
     Goto granddone

   StrCmp $R6 `` 0 +2
     StrCpy $R6 >

   StrCmp $R7 `` 0 +2
     StrCpy $R7 >

   # Preparing StrStr

   StrCpy $R0 0

   IntCmp $R9 1 +2 0 +2
     StrCpy $R9 0

   IntOp $R9 $R9 + 1

   # Loops and more loops if you want...

     grandloop:

     # Detect if the loops number given by user = code runs...

     StrCpy $R4 0
     StrLen $R3 $R1
     StrCpy $6 $R3
     StrCmp $9 1 0 +4
       StrCmp $R6 `<` 0 +2
         IntOp $R3 $R3 + 1
         IntOp $R4 $R4 + 1

     StrCmp $R6 `<` 0 +5
       IntOp $R3 $R3 * -1
       StrCpy $6 $R3
       IntCmp $R0 0 +2 0 0
         IntOp $6 $6 + 1

     # Searching the string

       loop:

       # RTL...

       StrCmp $R6 `<` 0 EndBack

         IntOp $9 $R4 * -1

         StrCmp $9 0 0 +3
           StrCpy $R5 $R2 `` $R3
           Goto +2
         StrCpy $R5 $R2 $9 $R3
         Goto +2

       EndBack:

       # LTR...

       StrCpy $R5 $R2 $R3 $R4

       # Detect if the value returned is the searched...

       StrCmp $R5 $R1 done

       StrCmp $R5 `` granddone

           # If not, make a loop...

           IntOp $R4 $R4 + 1
           StrCmp $R6 `<` 0 +2
             IntOp $R3 $R3 - 1

       Goto loop

     done:

     StrCmp $R6 `<` 0 +3
       IntOp $8 $9 + $8
         Goto +2
     IntOp $8 $R4 + $8

     # Looping Calculation...

      IntOp $R0 $R0 + 1

     IntCmp $R0 $R9 0 continueloop 0

     # Customizing the string to fit user conditions (supported by loops)...

     # RTL...

       StrCmp $R6 `<` 0 EndBackward
         StrCmp $R7 `>` 0 +7
           StrCmp $8 0 0 +3
             StrCpy $R2 ``
             Goto +2
           StrCpy $R2 $7 `` $8
           StrCpy $R2 $R1$R2
           Goto +3

         StrCmp $9 0 +2
           StrCpy $R2 $R2 $9

         StrCmp $R8 1 EndForward 0
           StrCmp $R7 `>` 0 End>
             Push $6
             IntOp $6 $6 * -1
             StrCpy $R2 $R2 `` $6
             Pop $6
               Goto +2
           End>:
           StrCpy $R2 $R2 $6
             Goto EndForward
       EndBackward:

       # LTR...

       StrCmp $R7 `<` 0 +4
         StrCpy $R2 $7 $8
         StrCpy $R2 $R2$R1
         Goto +2
       StrCpy $R2 $R2 `` $R4
       StrCmp $R8 1 EndForward 0
         StrCmp $R7 `<` 0 End<
           Push $6
           IntOp $6 $6 * -1
           StrCpy $R2 $R2 $6
           Pop $6
             Goto +2
         End<:
         StrCpy $R2 $R2 `` $R3
       EndForward:

       Goto stoploop

     continueloop:

     # Customizing the string to fits user conditions (not supported by loops)...

     # RTL...

     StrCmp $R6 `<` 0 +4
       StrCmp $9 0 +4
       StrCpy $R2 $R2 $9
         Goto +2

     # LTR...

     StrCpy $R2 $R2 `` $R4

     stoploop:

     # Return to grandloop init...

     StrCpy $9 1

     IntCmp $R0 $R9 0 grandloop 0

   StrCpy $R4 $R2

   Goto +2

   granddone:

   # Return the result to user

   StrCpy $R4 ``

   Pop $6
   Pop $7
   Pop $8
   Pop $9
   Pop $R0
   Pop $R1
   Pop $R2
   Pop $R3
   Pop $R9
   Pop $R8
   Pop $R7
   Pop $R6
   Pop $R5
   Exch $R4

  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrStrAdv_Call ResultVar String StrToSearchFor SearchDirection ResultStrDirection DisplayStrToSearch Loops

  !echo `$ {StrStrAdv} "${ResultVar}" "${String}" "${StrToSearchFor}" "${SearchDirection}" "${ResultStrDirection}" "${DisplayStrToSearch}" "${Loops}"$\r$\n`

  Push `${String}`
  Push `${StrToSearchFor}`
  Push `${SearchDirection}`
  Push `${ResultStrDirection}`
  Push `${DisplayStrToSearch}`
  Push `${Loops}`

  Call AdvancedStrStr

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrStrAdv_Call ResultVar String StrToSearchFor SearchDirection ResultStrDirection DisplayStrToSearch Loops

  !echo `$ {UnStrStrAdv} "${ResultVar}" "${String}" "${StrToSearchFor}" "${SearchDirection}" "${ResultStrDirection}" "${DisplayStrToSearch}" "${Loops}"$\r$\n`

  Push `${String}`
  Push `${StrToSearchFor}`
  Push `${SearchDirection}`
  Push `${ResultStrDirection}`
  Push `${DisplayStrToSearch}`
  Push `${Loops}`

  Call un.AdvancedStrStr

  Pop `${ResultVar}`

!macroend

# Function StrTok
###############

!macro FUNCTION_STRING_StrTok

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nAdvanced Token String Function - � 2004 Diego Pedroso$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrTok
    !define UnStrTok `!insertmacro FUNCTION_STRING_UnStrTok_Call`
    Function un.AdvancedStrTok
  !else
    !undef StrTok
    !define StrTok `!insertmacro FUNCTION_STRING_StrTok_Call`
    Function AdvancedStrTok
  !endif

    Exch $9
    Exch
    Exch $R0
    Exch 2
    Exch $R1
    Exch 3
    Exch $R2
    Push $R3
    Push $R4
    Push $R5
    Push $R6
    Push $R7
    Push $R8
    Push $R9
    Push $0
    Push $1
    Push $2

    StrCpy $R8 0
    StrCpy $R9 $R1
    
    IntCmp $R0 0 0 0 +2
      StrCpy $R0 L
    
    
    StrCmp $R0 L 0 +5
      StrCpy $2 1
      StrCpy $R0 0
      StrCpy $1 ``
      StrCpy $9 1
    
    PartLoop:

    StrCpy $R4 0
    IntOp $R8 $R8 + 1
    StrCpy $0 0
    
    loop:

      StrCpy $R5 $R2 1 $R4
      StrCmp $R5 `` done

      StrCpy $R6 -1
      StrCpy $R7 0
      loop2:

        IntOp $R6 $R6 + 1
        IntOp $R7 $R6 + 1
        StrCpy $R3 $R1 $R7 $R6
        StrCmp $R3 `` 0 +3
          IntOp $0 $0 + 1
          Goto ContLoop2
        StrCmp $R5 $R3 0 Loop2
          StrCmp $9 1 0 done
            StrCmp $0 0 0 done
              StrCpy $R2 $R2 `` 1
              Goto Loop
          
      ContLoop2:

      IntOp $R4 $R4 + 1
      Goto loop

    done:
    IntOp $R4 $R4 + $0
    StrCpy $R1 $R2 $0
    IntOp $0 $0 + 1
    StrCpy $R2 $R2 `` $0
    
    StrCmp $2 1 0 +4
      StrCmp $R1 `` 0 +3
        StrCpy $R1 $1
        Goto End

    StrCmp $R0 $R8 End
      StrCmp $2 1 0 +2
        StrCpy $1 $R1
      StrCpy $R1 $R9
      Goto PartLoop
      
    End:

    StrCpy $9 $R1

    Pop $2
    Pop $1
    Pop $0
    Pop $R9
    Pop $R8
    Pop $R7
    Pop $R6
    Pop $R5
    Pop $R4
    Pop $R3
    Pop $R2
    Pop $9
    Pop $R0
    Exch $R1
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrTok_Call ResultVar StrToTokenize Separators ResultPart SkipEmptyParts

  !echo `$ {StrTok} "${ResultVar}" "${StrToTokenize}" "${Separators}" "${ResultPart}" "${SkipEmptyParts}"$\r$\n`

  Push `${StrToTokenize}`
  Push `${Separators}`
  Push `${ResultPart}`
  Push `${SkipEmptyParts}`

  Call AdvancedStrTok

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrTok_Call ResultVar StrToTokenize Separators ResultPart SkipEmptyParts

  !echo `$ {UnStrTok} "${ResultVar}" "${StrToTokenize}" "${Separators}" "${ResultPart}" "${SkipEmptyParts}"$\r$\n`

  Push `${StrToTokenize}`
  Push `${Separators}`
  Push `${ResultPart}`
  Push `${SkipEmptyParts}`

  Call un.AdvancedStrTok

  Pop `${ResultVar}`

!macroend

# Function StrTrimNewLines
########################

!macro FUNCTION_STRING_StrTrimNewLines

  !echo `$\r$\n----------------------------------------------------------------------$\r$\nTrim New Lines Function - 2003-2004 Ximon Eighteen$\r$\n----------------------------------------------------------------------$\r$\n$\r$\n`

  !ifdef FUNCTION_STRING_UninstSupport
    !undef UnStrTrimNewLines
    !define UnStrTrimNewLines `!insertmacro FUNCTION_STRING_UnStrTrimNewLines_Call`
    Function un.TrimNewlines
  !else
    !undef StrTrimNewLines
    !define StrTrimNewLines `!insertmacro FUNCTION_STRING_StrTrimNewLines_Call`
    Function TrimNewlines
  !endif

    Exch $R0
    Push $R1
    Push $R2
    StrCpy $R1 0

  loop:
    IntOp $R1 $R1 - 1
    StrCpy $R2 $R0 1 $R1
    StrCmp $R2 `$\r` loop
    StrCmp $R2 `$\n` loop

    IntOp $R1 $R1 + 1
    IntCmp $R1 0 no_trim_needed
    StrCpy $R0 $R0 $R1

  no_trim_needed:
    Pop $R2
    Pop $R1
    Exch $R0
  FunctionEnd

!macroend

!macro FUNCTION_STRING_StrTrimNewLines_Call ResultVar String

  !echo `$ {StrTrimNewLines} "${ResultVar}" "${String}"$\r$\n`

  Push `${String}`

  Call TrimNewLines

  Pop `${ResultVar}`

!macroend

!macro FUNCTION_STRING_UnStrTrimNewLines_Call ResultVar String

  !echo `$ {UnStrTrimNewLines} "${ResultVar}" "${String}"$\r$\n`

  Push `${String}`

  Call un.TrimNewLines

  Pop `${ResultVar}`

!macroend

!ifndef MUI_VERBOSE
  !define MUI_VERBOSE 4
!endif
