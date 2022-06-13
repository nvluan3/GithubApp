!define REG    `${SET}\${APP}.reg`
!define DEFREG `${DEFDATA}\settings\${APP}.reg`
 
!define CFG    `${SET}\user.config`
!define DEFCFG `${DEFDATA}\settings\user.config`
 
!define LANG   `HKEY_LOCAL_MACHINE\SOFTWARE\NeoSmart Technologies\EasyBCD`
!define KEY    Language
 
!define DIR    `${DATA}\Backups`
 
!define HKLM   HKLM
!define NET    `SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full`
 
!define PFM    `$0\PortableApps.com\PortableAppsPlatform.exe`
 
!include DotNetVer.nsh
 
Function GetLCID
	!macro _GetLCID _LNG _LCID
		Push ${_LNG}
		Call GetLCID
		Pop ${_LCID}
	!macroend
	!define GetLCID "!insertmacro _GetLCID"
	Exch $0
	StrCmp $0 ar 0 +3
	StrCpy $0 1025
		Goto EndLCID
	StrCmp $0 ca 0 +3
	StrCpy $0 1027
		Goto EndLCID
	StrCmp $0 de 0 +3
	StrCpy $0 1031
		Goto EndLCID
	StrCmp $0 en-US 0 +3
	StrCpy $0 1033
		Goto EndLCID
	StrCmp $0 es 0 +3
	StrCpy $0 1034
		Goto EndLCID
	StrCmp $0 fr 0 +3
	StrCpy $0 1036
		Goto EndLCID
	StrCmp $0 it 0 +3
	StrCpy $0 1040
		Goto EndLCID
	StrCmp $0 ko 0 +3
	StrCpy $0 1042
		Goto EndLCID
	StrCmp $0 pl 0 +3
	StrCpy $0 1045
		Goto EndLCID
	StrCmp $0 ru 0 +3
	StrCpy $0 1049
		Goto EndLCID
	StrCmp $0 sv 0 +3
	StrCpy $0 1053
		Goto EndLCID
	StrCmp $0 uk 0 +3
	StrCpy $0 1058
		Goto EndLCID
	StrCmp $0 zh-CHS 0 +3
	StrCpy $0 2052
		Goto EndLCID
	StrCmp $0 zh-TW 0 +3
	StrCpy $0 1028
		Goto +2
	StrCpy $0 1033
	EndLCID:
	Exch $0
FunctionEnd
Function GetLNG
	!macro _GetLNG _LCID _LNG
		Push ${_LCID}
		Call GetLNG
		Pop ${_LNG}
	!macroend
	!define GetLNG "!insertmacro _GetLNG"
	Exch $0
	StrCmp $0 1025 0 +3
	StrCpy $0 ar
		Goto EndLNG
	StrCmp $0 1027 0 +3
	StrCpy $0 ca
		Goto EndLNG
	StrCmp $0 1031 0 +3
	StrCpy $0 de
		Goto EndLNG
	StrCmp $0 1033 0 +3
	StrCpy $0 en-US
		Goto EndLNG
	StrCmp $0 1034 0 +3
	StrCpy $0 es
		Goto EndLNG
	StrCmp $0 1036 0 +3
	StrCpy $0 fr
		Goto EndLNG
	StrCmp $0 1040 0 +3
	StrCpy $0 it
		Goto EndLNG
	StrCmp $0 1042 0 +3
	StrCpy $0 ko
		Goto EndLNG
	StrCmp $0 1045 0 +3
	StrCpy $0 pl
		Goto EndLNG
	StrCmp $0 1049 0 +3
	StrCpy $0 ru
		Goto EndLNG
	StrCmp $0 1053 0 +3
	StrCpy $0 sv
		Goto EndLNG
	StrCmp $0 1058 0 +3
	StrCpy $0 uk
		Goto EndLNG
	StrCmp $0 2052 0 +3
	StrCpy $0 zh-CHS
		Goto EndLNG
	StrCmp $0 1028 0 +3
	StrCpy $0 zh-TW
		Goto +2
	StrCpy $0 error
	EndLNG:
	Exch $0
FunctionEnd

${SegmentFile}
${Segment.OnInit}
	Push $0
	IfFileExists `${SETINI}` +2
	CreateDirectory `${SET}`
	${IsWOW64} $0
	StrCmp $0 0 0 +3
	WriteINIStr `${SETINI}` ${APPNAME}Settings Architecture 32
		Goto +3
	SetRegView 64
	WriteINIStr `${SETINI}` ${APPNAME}Settings Architecture 64
	Pop $0
!macroend

!macro OS
	Push $0
	${If} ${IsNT}
		${IfNot} ${AtLeastWinXP}
			StrCpy $0 `Windows XP or newer...`
			MessageBox MB_ICONSTOP|MB_TOPMOST `$(MINREQ)`
			Call Unload
			Quit
		${EndIf}
	${Else}
		StrCpy $0 `Windows XP or newer...`
		MessageBox MB_ICONSTOP|MB_TOPMOST `$(MINREQ)`
		Call Unload
		Quit
	${EndIf}
	${IfNot} ${HasDotNet2.0}
	${AndIfNot} ${HasDotNet3.0}
	${AndIfNot} ${HasDotNet3.5}
	${AndIfNot} ${HasDotNet4.0}
		ReadRegDWORD $0 ${HKLM} `${NET}` Release
		IntCmp $0 378389 +5 0 +5
		StrCpy $0 `.NET Framework`
		MessageBox MB_ICONSTOP|MB_TOPMOST `$(MINREQ)`
		Call Unload
		Quit
	${EndIf}
	Pop $0
!macroend

!macro Lang
	Push $0
	${GetParent} `$EXEDIR` $0
	${If} ${FileExists} `${PFM}`
		ReadEnvStr $0 PortableApps.comLocaleID
		${GetLNG} $0 $0
		${If} $0 == error
			IfFileExists `${REG}` 0 +3
			ReadINIStr $0 `${REG}` `${LANG}` `"${KEY}"`
			Goto +2
			ReadINIStr $0 `${DEFREG}` `${LANG}` `"${KEY}"`
			${GetLCID} $0 $0
			${SetEnvironmentVariable} PortableApps.comLocaleID $0
		${EndIf}
	${Else}
		IfFileExists `${REG}` 0 +3
		ReadINIStr $0 `${REG}` `${LANG}` `"${KEY}"`
		Goto +2
		ReadINIStr $0 `${DEFREG}` `${LANG}` `"${KEY}"`
		${GetLCID} $0 $0
		${SetEnvironmentVariable} PortableApps.comLocaleID $0
	${EndIf}
	Pop $0
!macroend

!macro LangInit
	Push $0
	ReadEnvStr $0 PortableApps.comLocaleID
	${GetLNG} $0 $0
	${SetEnvironmentVariable} PAL:LanguageCustom $0
	Pop $0
!macroend

!macro Init
	IfFileExists `${REG}` +2
	CopyFiles /SILENT `${DEFREG}` `${REG}`
	IfFileExists `${CFG}` +2
	CopyFiles /SILENT `${DEFCFG}` `${CFG}`
	IfFileExists `${DIR}` +2
	CreateDirectory `${DIR}`
!macroend

${SegmentPostPrimary}
	FindFirst $0 $1 `$LOCALAPPDATA\Microsoft\*`
		${DoWhile} $1 != ""
			StrCmp $1 "." +6
			StrCmp $1 ".." +5
			StrCpy $2 $1 3
			StrCmp $2 CLR 0 +3
			Delete `$LOCALAPPDATA\Microsoft\$1\UsageLogs\EasyBCD.exe.log`
			RMDir `$LOCALAPPDATA\Microsoft\$1\UsageLogs`
		FindNext $0 $1
		${Loop}
	FindClose $0
	${If} ${AtMostWin2003}
		FindFirst $0 $1 `$WINDIR\Microsoft.NET\Framework\*`
			${DoWhile} $1 != ""
				StrCmp $1 "." +6
				StrCmp $1 ".." +5
				IfFileExists `$WINDIR\Microsoft.NET\Framework\$1\CONFIG\*.cch` 0 +4
				Delete `$WINDIR\Microsoft.NET\Framework\$1\CONFIG\enterprisesec.config.cch`
				Delete `$WINDIR\Microsoft.NET\Framework\$1\CONFIG\security.config.cch`
				Goto ExitLoop
			FindNext $0 $1
			${Loop}
		ExitLoop:
		FindClose $0
	${EndIf}
!macroend