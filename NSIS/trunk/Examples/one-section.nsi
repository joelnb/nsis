# This example demonstrates how to control section selection.
# It allows only one of the four optional section to be
# selected at any given time.

#############################################################
# New macros which make this so much easier can be found in #
# Include\Sections.nsh.                                     #
#############################################################

#### Uncomment the next line for an example with subsections too
# !define USE_SUBSECTION
####

Name example
OutFile one-section.exe

Page components

# defines SF_*, SECTION_OFF and some macros
!include Sections.nsh

Section !Required
	SectionIn RO
SectionEnd

!ifdef USE_SUBSECTION
	SubSection /e "choose one" subsec
!endif

Section "optional #1" sec1
SectionEnd

Section /o "optional #2" sec2
SectionEnd

Section /o "optional #3" sec3
SectionEnd

Section /o "optional #4" sec4
SectionEnd

!ifdef USE_SUBSECTION
	SubSectionEnd
!endif

Function .onInit
	StrCpy $1 ${sec1} ; Gotta remember which section we are at now...
FunctionEnd

Function .onSelChange
!ifdef USE_SUBSECTION
; Check if the user have selected all of the sections using the sub-section
; This piece of code is not needed when there are only two sections
	Push $0
	
	SectionGetFlags ${subsec} $0
	IntOp $0 $0 & ${SF_SELECTED}
	StrCmp $0 0 skip
		SectionSetFlags ${sec1} 0
		SectionSetFlags ${sec2} 0
		SectionSetFlags ${sec3} 0
		SectionSetFlags ${sec4} 0
	skip:
	
	Pop $0
!endif

	!insertmacro StartRadioButtons $1
	!insertmacro RadioButton ${sec1}
	!insertmacro RadioButton ${sec2}
	!insertmacro RadioButton ${sec3}
	!insertmacro RadioButton ${sec4}
	!insertmacro EndRadioButtons
FunctionEnd