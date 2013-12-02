; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Homenet"
!define APPNAMEANDVERSION "Homenet pack 0.3.0"

  VIProductVersion         "1.0.0.0"
  VIAddVersionKey          "FileVersion"        "1.0.1" 
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
;kill
!include "nsProcess.nsh"
!include "Sections.nsh"



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
	File /r "greylink0017\greylink\*.*"
	
	SetOutPath "$INSTDIR\homenet\"
	File /r "homenet_tool\*.*"

	SetOutPath "$INSTDIR\tightvnc\"
	File /r "tightvnc\*.*"
	
	CreateShortCut "$DESKTOP\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateDirectory "$SMPROGRAMS\Homenet"
	CreateShortCut "$SMPROGRAMS\Homenet\ping_test.lnk" "$INSTDIR\homenet\ping.exe"
	
	;сайты
	CreateShortCut "$SMPROGRAMS\Homenet\Сайт Home-net.lnk" "http://home-net.org/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$DESKTOP\Сайт Home-net.lnk" "http://home-net.org/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$SMPROGRAMS\Homenet\Статистика Интернета.lnk" "https://sun.home-net.net.ua/abills/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$DESKTOP\Статистика Интернета.lnk" "https://sun.home-net.net.ua/abills/" "" "$INSTDIR\homenet\homenet.ico"
	
	
	CreateShortCut "$SMPROGRAMS\Homenet\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
  CreateShortCut "$SMPROGRAMS\Homenet\VNC.lnk" "$INSTDIR\tightvnc\WinVNC.exe"

	CreateShortCut "$SMPROGRAMS\Homenet\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	
	
SectionEnd

Section /o "x64" Section2

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\greylink\"
	File /r "greylink_homenet-x64\greylink\*.*"

	SetOutPath "$INSTDIR\homenet\"
	File /r "homenet_tool\*.*"

	SetOutPath "$INSTDIR\tightvnc\"
	File /r "tightvnc\*.*"
	
	CreateShortCut "$DESKTOP\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateDirectory "$SMPROGRAMS\Homenet"

	CreateShortCut "$SMPROGRAMS\Homenet\ping_test.lnk" "$INSTDIR\homenet\ping.exe"
  CreateShortCut "$SMPROGRAMS\Homenet\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
 
	;сайты
	CreateShortCut "$SMPROGRAMS\Homenet\Сайт Home-net.lnk" "http://home-net.org/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$DESKTOP\Сайт Home-net.lnk" "http://home-net.org/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$SMPROGRAMS\Homenet\Статистика Интернета.lnk" "https://sun.home-net.net.ua/abills/" "" "$INSTDIR\homenet\homenet.ico"
	CreateShortCut "$DESKTOP\Статистика Интернета.lnk" "https://sun.home-net.net.ua/abills/" "" "$INSTDIR\homenet\homenet.ico"
	
  CreateShortCut "$SMPROGRAMS\Homenet\VNC.lnk" "$INSTDIR\tightvnc\WinVNC.exe"
 
	CreateShortCut "$SMPROGRAMS\Homenet\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	

SectionEnd
;служба DHCP-клиент (DHCP Client)
Section /o "включить DHCP-клиент" Section3
	; Set Section properties
	SetOverwrite on
	GetVersion::WindowsName
	Pop $R0
	
	StrCmp $R0 "7" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dhcp" "Start" "00000002"
	
	StrCmp $R0 "Vista" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dhcp" "Start" "00000002"

	StrCmp $R0 "XP" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dhcp" "Start" "00000002"
	
	StrCmp $R0 "XP x64" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dhcp" "Start" "00000002"
	
SectionEnd
;DNS-клиент (DNS Client)
Section /o "включить DNS-клиент" Section4
	; Set Section properties
	SetOverwrite on
	GetVersion::WindowsName
	Pop $R0
	
	StrCmp $R0 "7" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dnscache" "Start" "00000002"
	
	StrCmp $R0 "Vista" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dnscache" "Start" "00000002"

	StrCmp $R0 "XP" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dnscache" "Start" "00000002"
	
	StrCmp $R0 "XP x64" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dnscache" "Start" "00000002"
	
SectionEnd
;IPSEC Services (Службы IPSEC)
Section /o "Отключить службу IPSEC" Section5
	; Set Section properties
	SetOverwrite on
	GetVersion::WindowsName
	Pop $R0
	
	StrCmp $R0 "7" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PolicyAgent" "Start" "00000004"
	
	StrCmp $R0 "Vista" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PolicyAgent" "Start" "00000004"

	StrCmp $R0 "XP" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PolicyAgent" "Start" "00000004"
	
	StrCmp $R0 "XP x64" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PolicyAgent" "Start" "00000004"
	
SectionEnd

;автозагрузка ДС+++
Section /o "автозагрузка DC++" Section6
	;autostart 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "homenet" "$INSTDIR\greylink\greylink.exe"
SectionEnd

Section /o "отключить IP версии 6" Section7
	;ipv6
	GetVersion::WindowsName
	Pop $R0
	
	StrCmp $R0 "Vista" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\" "DisabledComponents" "0xffffffff"
	
	StrCmp $R0 "7" 0 +2
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\" "DisabledComponents" "4294967295"

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

	;vnc section
	;seven
	GetVersion::WindowsName
	Pop $R0
	;DHCP-клиент (DHCP Client)
	;DNS-клиент (DNS Client)
	;Агент политики IPsec (IPsec Policy Agent)
	;Маршрутизация и удаленный доступ (Routing and Remote Access)
	;StrCmp $R0 "7" 0 +7
	;WriteRegBin  HKCU "Software\ORL\WinVNC3" "Password" "04a80c01b072856f"
	;WriteRegBin  HKCU "Software\ORL\WinVNC3" "PasswordViewOnly" "04a80c01b072856f"
	;WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dhcp" "Start" "00000002"
	;WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\Dnscache" "Start" "00000002"
	;WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PolicyAgent" "Start" "00000003"
	;WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RemoteAccess" "Start" "00000004"
	;GetVersion::WindowsName
	;Pop $R0
	;StrCmp $R0 "xp" 0 +3
	;WriteRegBin  HKCU "S-1-5-21-1801674531-1343024091-789743027-1004\Software\ORL\WinVNC3" "Password" "04a80c01b072856f"
	;WriteRegBin  HKCU "S-1-5-21-1801674531-1343024091-789743027-1004\Software\ORL\WinVNC3" "PasswordViewOnly" "04a80c01b072856f"
	
MessageBox MB_YESNO|MB_ICONQUESTION "Нужно перезегрузиться. Хотите выполнить перезагрузку сейчас?" IDNO +3
Exec '"$INSTDIR\homenet\route_f.bat"'
Reboot
SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Windows XP,Vista,7 32bit"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Widows XP, Vista, 7 64bit"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Включить службу DHCP-клиент (DHCP Client)"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section4} "Включить службу DNS-клиент (DNS Client)"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section5} "Отключить службу IPSEC"	
	!insertmacro MUI_DESCRIPTION_TEXT ${Section6} "включить автозагрузку ДС++"	
	!insertmacro MUI_DESCRIPTION_TEXT ${Section7} "отключить TCP/IP версии 6 Windows Vista, 7 у Нас не используется но является брешью в безопасности"	
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
	Delete "$DESKTOP\Greylink.lnk"
	Delete "$SMPROGRAMS\Homenet\ping_test.lnk" 
	Delete "$SMPROGRAMS\Homenet\Greylink.lnk"
	Delete "$SMPROGRAMS\Homenet\Uninstall.lnk"
	;Delete "$SMPROGRAMS\Homenet\VNC.lnk"
	Delete "$SMPROGRAMS\Homenet\ping_test.lnk" 
	; RMDir /r "$SMPROGRAMS\Homenet\"
	RMDir /r "$INSTDIR\greylink\"

SectionEnd

; On initialization
Function .onInit
	;enable DHCP client by default
	SectionSetFlags ${section3} 1
	;enable DNS client by default
	SectionSetFlags ${section4} 1	
	;disable IPSEC Services (Службы IPSEC)
	SectionSetFlags ${section5} 1	
	;autostart dc++
	SectionSetFlags ${section6} 1	
	;ип версии 6
	SectionSetFlags ${Section7} 1
	
	;if 32 bit set for 32bit
	GetVersion::WindowsPlatformId
	Pop $R0
	SectionSetFlags ${section1} 0
	SectionSetFlags ${section2} 1
	;Goto +7
	StrCmp $R0 "64" 0 +4
	SectionSetFlags ${section1} 0
	SectionSetFlags ${section2} 1
	Goto +3
	SectionSetFlags ${section1} 1
  SectionSetFlags ${section2} 0
	;;;;;;;;;;;;;;;;;
Goto start
end:
	Quit
start:	
	${nsProcess::FindProcess} "greylink.exe" $R0
	StrCmp $R0 0 0 +5
	MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION 'Закрыть "ДС++" для продолжения установки?' IDOK loop IDCANCEL end
loop:
	${nsProcess::KillProcess} "greylink.exe" $R0
	MessageBox MB_OK "Приложение ДС++ было завершено" ;	Errorlevel: [$R0]"
	${nsProcess::Unload}

	;end:
	; kill DC++
  ; nsExec::Exec '$INSTDIR\homenet\wkill.exe -n "greylink.exe"'
	!insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

BrandingText "home-net"

; eof