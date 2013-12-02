; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Homenet"
!define APPNAMEANDVERSION "Homenet pack 0.0.9"

  VIProductVersion         "1.0.0.0"
  VIAddVersionKey          "FileVersion"        "1.0.0" 
  VIAddVersionKey          "ProductName"           "HomenetPack"
  VIAddVersionKey          "CompanyName"          "Homenet"
  VIAddVersionKey          "LegalTrademarks"       "home-net.org"
  VIAddVersionKey          "LegalCopyright"        "CopyRights 2010© to wel@skm.net.ua" 
	VIAddVersionKey          "FileDescription"       "dc++"
	
; !define SF_SELECTED   1
; !define SF_SUBSEC     2
; !define SF_SUBSECEND  4
; !define SF_BOLD       8
; !define SF_RO         16
; !define SF_EXPAND     32
; !define SECTION_OFF   0xFFFFFFFE
; ExecShell

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\Homenet"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "homenet_pack_full.exe"

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_FINISHPAGE_RUN_TEXT "Выберети что бы запустить DC++"
!define MUI_FINISHPAGE_RUN "$INSTDIR\greylink\greylink.exe"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "License.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
;!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_RESERVEFILE_LANGDLL



Section /o  "x86" Section1

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\greylink\"
	File /r "greylink05999\greylink\*.*"
	
	SetOutPath "$INSTDIR\homenet\"
	File /r "homenet_tool\*.*"

	CreateShortCut "$DESKTOP\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateDirectory "$SMPROGRAMS\Homenet"
	CreateShortCut "$SMPROGRAMS\Homenet\ping_test.lnk" "$INSTDIR\homenet\ping.exe"
	CreateShortCut "$SMPROGRAMS\Homenet\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateShortCut "$SMPROGRAMS\Homenet\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	;autostart 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "homenet" "$INSTDIR\greylink\greylink.exe"

SectionEnd

Section /o "x64" Section2

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\greylink\"
	File /r "greylink_homenet-x64\greylink\*.*"

	SetOutPath "$INSTDIR\homenet\"
	File /r "homenet_tool\*.*"

	CreateShortCut "$DESKTOP\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateDirectory "$SMPROGRAMS\Homenet"
	CreateShortCut "$SMPROGRAMS\Homenet\ping_test.lnk" "$INSTDIR\homenet\ping.exe"
	CreateShortCut "$SMPROGRAMS\Homenet\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateShortCut "$SMPROGRAMS\Homenet\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	;autostart 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "homenet" "$INSTDIR\greylink\greylink.exe"

SectionEnd

Function .onSelChange 
 SectionGetFlags ${section1} $1 
 SectionGetFlags ${section2} $2 
 
StrCmp $1 "1" 0 N1 
 SectionGetFlags ${section2} $0 
 IntOp $0 $0 & ${SECTION_OFF} 
 SectionSetFlags ${section2} $0 
N1: 
StrCmp $2 "1" 0 N2 
 SectionGetFlags ${section1} $0 
 IntOp $0 $0 & ${SECTION_OFF} 
 SectionSetFlags ${section1} $0  
N2: 

FunctionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Windows XP,Vista,7 32bit"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Widows XP, Vista, 7 64bit"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\Greylink.lnk"
	Delete "$SMPROGRAMS\Homenet\ping_test.lnk" 
	Delete "$SMPROGRAMS\Homenet\Greylink.lnk"
	Delete "$SMPROGRAMS\Homenet\Uninstall.lnk"

	; RMDir /r "$SMPROGRAMS\Homenet\"
	RMDir /r "$INSTDIR\greylink\"

SectionEnd

; On initialization
Function .onInit

	!insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

BrandingText "home-net"

; eof