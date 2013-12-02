; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Skyhome"
!define PRODUCT_VERSION "0.4.01"
!define APPNAMEANDVERSION "Skyhome pack ${PRODUCT_VERSION}"

  VIProductVersion         "1.${PRODUCT_VERSION}"
  VIAddVersionKey          "FileVersion"        "${PRODUCT_VERSION}" 
  VIAddVersionKey          "ProductName"           "Skyhome pack"
  VIAddVersionKey          "CompanyName"          "Skyhome"
  VIAddVersionKey          "LegalTrademarks"       "www.skm.net.ua"
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
InstallDir "$PROGRAMFILES\Skyhome"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
;OutFile "Skyhome_pack_full.exe"
OutFile "Skyhome_pack_full-${PRODUCT_VERSION}.exe"
; Modern interface settings
!include "MUI2.nsh"
;kill
!include "nsProcess.nsh"
!include "Sections.nsh"

  !define MUI_HEADERIMAGE
  ;!define MUI_HEADERIMAGE_BITMAP "logo.bmp" ; optional
	
;!define MUI_COMPONENTSPAGE_SMALLDESC
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000" ;Два цвета


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

 

Section /o  "Windows x86 32bit" Section1

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\greylink\"
	File /r "greylink0021\greylink\*.*"
	
	SetOutPath "$INSTDIR\Skyhome\"
	File /r "homenet_tool\*.*"

	SetOutPath "$INSTDIR\tightvnc\"
	File /r "tightvnc\*.*"
	
	CreateShortCut "$DESKTOP\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateDirectory "$SMPROGRAMS\Skyhome"
	CreateShortCut "$SMPROGRAMS\Skyhome\ping_test.lnk" "$INSTDIR\Skyhome\ping.exe"
	
	;сайты
	CreateShortCut "$SMPROGRAMS\Skyhome\Сайт Skyhome.lnk" "http://www.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$DESKTOP\Сайт Skyhome.lnk" "http://www.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$SMPROGRAMS\Skyhome\WinMTR.lnk" "$INSTDIR\Skyhome\winmtr_0.8\WinMTR.exe"
	CreateShortCut "$SMPROGRAMS\Skyhome\Статистика Интернета.lnk" "https://stat.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$DESKTOP\Статистика Интернета.lnk" "https://stat.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$SMPROGRAMS\Skyhome\Медиасервер Skyhome.lnk" "http://media.skyhome/" "" "$INSTDIR\Skyhome\skyhome.ico"

	
	CreateShortCut "$SMPROGRAMS\Skyhome\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
  CreateShortCut "$SMPROGRAMS\Skyhome\VNC.lnk" "$INSTDIR\tightvnc\WinVNC.exe"

	CreateShortCut "$SMPROGRAMS\Skyhome\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	
	
SectionEnd

Section /o "Windows x64 64bit" Section2

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\greylink\"
	File /r "greylink0018-x64\greylink\*.*"

	SetOutPath "$INSTDIR\Skyhome\"
	File /r "homenet_tool\*.*"

	SetOutPath "$INSTDIR\tightvnc\"
	File /r "tightvnc\*.*"
	
	CreateShortCut "$DESKTOP\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
	CreateDirectory "$SMPROGRAMS\Skyhome"

	CreateShortCut "$SMPROGRAMS\Skyhome\ping_test.lnk" "$INSTDIR\Skyhome\ping.exe"
  CreateShortCut "$SMPROGRAMS\Skyhome\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
 
	;сайты
	CreateShortCut "$SMPROGRAMS\Skyhome\Сайт Skyhome.lnk" "http://www.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$DESKTOP\Сайт Skyhome.lnk" "http://www.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$SMPROGRAMS\Skyhome\WinMTR.lnk" "$INSTDIR\Skyhome\winmtr_0.8\WinMTR.exe"
	CreateShortCut "$SMPROGRAMS\Skyhome\Статистика Интернета.lnk" "https://stat.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$DESKTOP\Статистика Интернета.lnk" "https://stat.skyhome/" "" "$INSTDIR\Skyhome\home.ico"
	CreateShortCut "$SMPROGRAMS\Skyhome\Медиасервер Skyhome.lnk" "http://media.skyhome/" "" "$INSTDIR\Skyhome\skyhome.ico"

	
	CreateShortCut "$SMPROGRAMS\Skyhome\Greylink.lnk" "$INSTDIR\greylink\greylink.exe"
  CreateShortCut "$SMPROGRAMS\Skyhome\VNC.lnk" "$INSTDIR\tightvnc\WinVNC.exe"

	CreateShortCut "$SMPROGRAMS\Skyhome\Uninstall.lnk" "$INSTDIR\uninstall.exe"
	

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
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "Skyhome" "$INSTDIR\greylink\greylink.exe"
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
;службы для создания подключения
Section /o "службы для создания подключения" Section8
	; Set Section properties
	SetOverwrite on
	;Remote Access Connection Manager (Диспетчер подключений удаленного доступа)
	;Remote Procedure Call (Локатор удаленного вызова процедур (RPC))
 	;Plug and Play (Plug and Play)
  ;Telephony (Телефония)
	;TCP/IP NetBIOS Helper Service (Модуль поддержки NetBIOS через TCP/IP)
	;DCOM Server Process Launcher (Запуск серверных процессов DCOM)
	;Server (Сервер)
	GetVersion::WindowsName
	Pop $R0
	
	StrCmp $R0 "7" 0 +8
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RasAuto" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RasMan" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RpcLocator" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\TapiSrv" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\lmhosts" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\DcomLaunch" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\LanmanServer" "Start" "00000002"
	
	StrCmp $R0 "Vista" 0 +8
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RasAuto" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RasMan" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RpcLocator" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\TapiSrv" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\lmhosts" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\DcomLaunch" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\LanmanServer" "Start" "00000002"
	

	StrCmp $R0 "XP" 0 +8
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RasMan" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RpcLocator" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PlugPlay" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\TapiSrv" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\LmHosts" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\DcomLaunch" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\lanmanserver" "Start" "00000002"
	
	StrCmp $R0 "XP x64" 0 +8
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RasMan" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\RpcLocator" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\PlugPlay" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\TapiSrv" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\LmHosts" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\DcomLaunch" "Start" "00000002"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\lanmanserver" "Start" "00000002"
	
SectionEnd
Section /o "отключить Брандмауэр Windows" Section9
	;ipv6
	GetVersion::WindowsName
	Pop $R0
	;Общий доступ к подключению к Интернету (ICS) (Internet Connection Sharing (ICS))
  ;Брандмауэр Windows (Windows Firewall)
	;Security Center (Центр обеспечения безопасности)
	StrCmp $R0 "7" 0 +4
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\SharedAccess" "Start" "00000004"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\MpsSv" "Start" "00000004"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\wscsvc" "Start" "00000004"
	
	StrCmp $R0 "Vista" 0 +4
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\SharedAccess" "Start" "00000004"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\MpsSv" "Start" "00000004"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\wscsvc" "Start" "00000004"
	
	StrCmp $R0 "XP x64" 0 +3
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\SharedAccess" "Start" "00000004"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\wscsvc" "Start" "00000004"	
	
	StrCmp $R0 "XP" 0 +3
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\SharedAccess" "Start" "00000004"
	WriteRegDWORD HKLM "SYSTEM\CurrentControlSet\Services\wscsvc" "Start" "00000004"
	
SectionEnd
Section /o "Перезаписать список Хабов" Section10
	SetOverwrite on
	;		SetOutPath "$INSTDIR\greylink\Settings\"
	;		File "Skyhome_tool\Favorites.xml"
	
	
		IfFileExists "$INSTDIR\greylink\Settings\Favorites.xml" 0 true_section10 
		MessageBox MB_YESNO "Файл с списком Хабов существует - Вы хотите его переписать? Если Вы его перепишете то пароли от хабов потеряются!!!" IDYES true_section10 IDNO false_section10
		true_section10:	
			SetOutPath "$INSTDIR\greylink\Settings\"
			File "settings\skyhome\Favorites.xml"
		  Goto next_section10
		false_section10:
			MessageBox MB_OK "Текущий список хабов: Skyhome: hub.skyhome (10.200.25.9), Homenet: fobos.skyhome:4012 (10.10.10.253:4012), homent.skyhome ( 10.24.0.3). Если он у Вас другой - добавьте их. Внимание ИП адресс может меняться."
		next_section10:
		
		
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
Exec '"$INSTDIR\Skyhome\route_f.bat"'
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
	!insertmacro MUI_DESCRIPTION_TEXT ${Section8} "службы для создания подключения: 	Remote Access Connection Manager (Диспетчер подключений удаленного доступа), Remote Procedure Call (Локатор удаленного вызова процедур (RPC)), Plug and Play (Plug and Play), Telephony (Телефония), TCP/IP NetBIOS Helper Service (Модуль поддержки NetBIOS через TCP/IP), DCOM Server Process Launcher (Запуск серверных процессов DCOM),Server (Сервер)" 
	!insertmacro MUI_DESCRIPTION_TEXT ${Section9} "Отключить службы: Общий доступ к подключению к Интернету (ICS) (Internet Connection Sharing (ICS)), Брандмауэр Windows (Windows Firewall), Security Center (Центр обеспечения безопасности)"
	!insertmacro MUI_DESCRIPTION_TEXT ${Section10} "Записывает файл со списком хабов. Однако в этом же файле хранятся и пароли. Будьте внимательны если Вы не хотите потерять пароли!"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegValue HKLM "Software\Microsoft\Windows\CurrentVersion\Run" "Skyhome"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\Greylink.lnk"
	Delete "$SMPROGRAMS\Skyhome\ping_test.lnk" 
	Delete "$SMPROGRAMS\Skyhome\Greylink.lnk"
	Delete "$SMPROGRAMS\Skyhome\Uninstall.lnk"
	;Delete "$SMPROGRAMS\Skyhome\VNC.lnk"
	Delete "$SMPROGRAMS\Skyhome\ping_test.lnk" 
	; RMDir /r "$SMPROGRAMS\Skyhome\"
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
	SectionSetFlags ${Section8} 1
	SectionSetFlags ${Section9} 0
	;IfFileExists "$INSTDIR\greylink\Settings\Favorites.xml" 0  
	;SectionSetFlags ${Section10} 0
	;Goto
	SectionSetFlags ${Section10} 1
	
	;IfFileExists "$INSTDIR\greylink\Settings\Favorites.xml" 0 true_section10 
	;	MessageBox MB_YESNO "Файл с списком Хабов существует - Вы хотите его переписать? Если Вы его перепишете то пароли от хабов потеряются!!!" IDYES true_section10 IDNO false_section10
	;	true_section10:	
	;		SectionSetFlags ${Section10} 1
	;	  Goto next_section10
	;	false_section10:
	;		SectionSetFlags ${Section10} 0
	;		MessageBox MB_OK "Текущий список хабов: Skyhome: 10.200.25.9, Skyhome: hub.Skyhome, hub.skyhome. Если он у Вас другой - добавьте их."
	;	next_section10:
	;	
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
  ; nsExec::Exec '$INSTDIR\Skyhome\wkill.exe -n "greylink.exe"'
	!insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

BrandingText "home-net"

; eof