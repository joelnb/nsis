; Some sections defines

; Include in your script using:
; !include "Sections.nsh"

!ifndef SECTIONS_NSH_INCLUDED

!define SECTIONS_NSH_INCLUDED

!define SF_SELECTED   1
!define SF_SUBSEC     2
!define SF_SUBSECEND  4
!define SF_BOLD       8
!define SF_RO         16
!define SF_EXPAND     32
!define SF_PSELECTED  64

!define SECTION_OFF   0xFFFFFFFE

!macro SelectSection SECTION
	Push $0
	SectionGetFlags "${SECTION}" $0
	IntOp $0 $0 | ${SF_SELECTED}
	SectionSetFlags "${SECTION}" $0
	Pop $0
!macroend

!macro UnselectSection SECTION
	Push $0
	SectionGetFlags "${SECTION}" $0
	IntOp $0 $0 & ${SECTION_OFF}
	SectionSetFlags "${SECTION}" $0
	Pop $0
!macroend

# if section selected, will unselect, if unselected, will select
!macro ReverseSection SECTION
	Push $0
	SectionGetFlags "${SECTION}" $0
	IntOp $0 $0 ^ ${SF_SELECTED}
	SectionSetFlags "${SECTION}" $0
	Pop $0
!macroend

# macros for mutually exclusive section selection
# written by Tim Gallagher

#### usage example:

# Function .onSelChange
# !insertmacro StartRadioButtons
# !insertmacro RadioButton ${sec1}
# !insertmacro RadioButton ${sec2}
# !insertmacro RadioButton ${sec3}
# !insertmacro EndRadioButtons
# FunctionEnd

# Function .onInit
# !insertmacro UnselectSection ${sec1}
# !insertmacro UnselectSection ${sec2}
# !insertmacro UnselectSection ${sec3}
# FunctionEnd

# starts the Radio Button Block
!macro StartRadioButtons
	Push $0
	SectionGetFlags $1 $0
	IntOp $0 $0 & ${SECTION_OFF}
	SectionSetFlags $1 $0

	Push $2
	StrCpy $2 $1
!macroend

!macro RadioButton SECTION_NAME
  SectionGetFlags ${SECTION_NAME} $0
	IntOp $0 $0 & ${SF_SELECTED}
	IntCmp $0 ${SF_SELECTED} 0 +2 +2
		StrCpy $1 ${SECTION_NAME}
!macroend

# ends the radio button block
!macro EndRadioButtons
	StrCmp $2 $1 0 +4 ; selection hasn't changed
		SectionGetFlags $1 $0
		IntOp $0 $0 | ${SF_SELECTED}
		SectionSetFlags $1 $0

	Pop $2
	Pop $0
!macroend

; For details about SetSectionInInstType and ClearSectionInInstType, see
; http://nsis.sourceforge.net/archive/nsisweb.php?page=287

!define INSTTYPE_1 1
!define INSTTYPE_2 2
!define INSTTYPE_3 4
!define INSTTYPE_4 8
!define INSTTYPE_5 16
!define INSTTYPE_6 32
!define INSTTYPE_7 64
!define INSTTYPE_8 128

!macro SetSectionInInstType SECTION_NAME WANTED_INSTTYPE
	Push $0
	SectionGetInstTypes "${SECTION_NAME}" $0
	IntOp $0 $0 | ${WANTED_INSTTYPE}
	SectionSetInstTypes "${SECTION_NAME}" $0
	Pop $0
!macroend

!macro ClearSectionInInstType SECTION_NAME WANTED_INSTTYPE
	Push $0
	Push $1
	SectionGetInstTypes "${SECTION_NAME}" $0
	StrCpy $1 ${WANTED_INSTTYPE}
	IntOp $1 $1 ~
	IntOp $0 $0 & $1
	SectionSetInstTypes "${SECTION_NAME}" $0
	Pop $1
	Pop $0
!macroend

# more macros by derekrprice

; Set one or more BITS in SECTION's flags.
!macro SetSectionFlag SECTION BITS
	Push $R0
	SectionGetFlags "${SECTION}" $R0
	IntOp $R0 $R0 | "${BITS}"
	SectionSetFlags "${SECTION}" $R0
	Pop $R0
!macroend

; Clear one or more BITS in SECTION's flags.
!macro ClearSectionFlag SECTION BITS
	Push $R0
	Push $R1
	SectionGetFlags "${SECTION}" $R0
	IntOp $R1 "${BITS}" ~
	IntOp $R0 $R0 & $R1
	SectionSetFlags "${SECTION}" $R0
	Pop $R1
	Pop $R0
!macroend

; Check if one or more BITS in SECTION's flags are set.
; If they are, jump to JUMPIFSET
; If not, jump to JUMPIFNOTSET
!macro SectionFlagIsSet SECTION BITS JUMPIFSET JUMPIFNOTSET
	Push $R0
	SectionGetFlags "${SECTION}" $R0
	IntOp $R0 $R0 & "${BITS}"
	IntCmp $R0 "${BITS}" +3
	Pop $R0
	StrCmp "" "${JUMPIFNOTSET}" +3 "${JUMPIFNOTSET}"
	Pop $R0
	Goto "${JUMPIFSET}"
!macroend


!endif