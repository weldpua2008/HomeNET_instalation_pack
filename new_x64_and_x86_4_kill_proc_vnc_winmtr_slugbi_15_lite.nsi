; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Homenet"
!define PRODUCT_VERSION "1.0.2"
!define APPNAMEANDVERSION "Homenet IPTV pack ${PRODUCT_VERSION}"

  VIProductVersion         "1.${PRODUCT_VERSION}"
  VIAddVersionKey          "FileVersion"        "${PRODUCT_VERSION}" 
  VIAddVersionKey          "ProductName"           "Homenet IPTV pack"
  VIAddVersionKey          "CompanyName"          "Homenet"
  VIAddVersionKey          "LegalTrademarks"       "www.home-net.org"
  VIAddVersionKey          "LegalCopyright"        "CopyRights 2010© to wel@skm.net.ua" 
	VIAddVersionKey          "FileDescription"       "iptv"
	
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
;OutFile "homenet_pack_full.exe"
OutFile "homenet_pack_iptv-${PRODUCT_VERSION}.exe"
; Modern interface settings
!include "MUI2.nsh"
;kill
!include "nsProcess.nsh"
!include "Sections.nsh"

  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "logo.bmp" ; optional
	
;!define MUI_COMPONENTSPAGE_SMALLDESC
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000" ;Два цвета


!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_FINISHPAGE_RUN_TEXT "Выберите что бы запустить IPTV"
!define MUI_FINISHPAGE_RUN "$INSTDIR\IPTVplayer\IpTvPlayer.exe"

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


	

Section /o "IPTV beta1" Section1
	SetOutPath "$INSTDIR\IPTVplayer"
	File /r "IP-TV_Playerb1\*.*"
	
	
	SetOutPath "$INSTDIR\homenet\"
	File /r "homenet_tool\*.*"
	CreateShortCut "$SMPROGRAMS\Homenet\IPTV.lnk" "$INSTDIR\IPTVplayer\IpTvPlayer.exe"
	CreateShortCut "$DESKTOP\IPTV.lnk" "$INSTDIR\IPTVplayer\IpTvPlayer.exe"
	;сайты
	
	CreateShortCut "$SMPROGRAMS\Homenet\Сайт Home-net.lnk" "http://home-net.org/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$DESKTOP\Сайт Home-net.lnk" "http://home-net.org/" "" "$INSTDIR\homenet\homenet.ico"
	
	CreateShortCut "$SMPROGRAMS\Homenet\Статистика Интернета.lnk" "https://sun.home-net.net.ua/abills/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$DESKTOP\Статистика Интернета.lnk" "https://sun.home-net.net.ua/abills/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$SMPROGRAMS\Homenet\Медиасервер Skyhome.lnk" "http://media.skyhome/" "" "$INSTDIR\homenet\skyhome.ico"



	CreateShortCut "$SMPROGRAMS\Homenet\Uninstall.lnk" "$INSTDIR\uninstall.exe"
		
		
	SectionEnd



Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"
	GetVersion::WindowsName
	Pop $R0


SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} "IPTV бета версия для Хоумнета"
	!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegValue HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "homenet"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\Homenet\IPTV.lnk"
	Delete "$SMPROGRAMS\Homenet\Uninstall.lnk"
	RMDir /r "$INSTDIR\IPTVplayer"

	; RMDir /r "$SMPROGRAMS\Homenet\"


SectionEnd

Function .onGUIEnd
	NSIS_SkinCrafter_Plugin::destroy
FunctionEnd

Function un.onInit
    ;User defined skin
    ;SetOutPath $TEMP
    ;File /oname=Stylish.skf "Stylish.skf"
    ;NSIS_SkinCrafter_Plugin::skin /NOUNLOAD $TEMP\Stylish.skf
    ;Delete $TEMP\Stylish.skf

    ;Default Skin
    NSIS_SkinCrafter_Plugin::skin /NOUNLOAD
FunctionEnd

Function un.onGUIEnd
	NSIS_SkinCrafter_Plugin::destroy
FunctionEnd

; On initialization
Function .onInit
		;User defined skin
    SetOutPath $TEMP
    File /oname=Gloss.skf "Gloss.skf"
    NSIS_SkinCrafter_Plugin::skin /NOUNLOAD $TEMP\Gloss.skf
    Delete $TEMP\Gloss.skf

    ;Default Skin
    ;NSIS_SkinCrafter_Plugin::skin /NOUNLOAD
		
	
	
	SectionSetFlags ${section1} 1
	
	;end:
	; kill DC++
  ; nsExec::Exec '$INSTDIR\homenet\wkill.exe -n "greylink.exe"'
	!insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

BrandingText "home-net"

; eof