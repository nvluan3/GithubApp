Dim OSArch,App_x86,App_x64, tApp,tCmdLine, WshShell,FileObj
App_x86 = "FixSpooler.exe"
App_x64 = "FixSpooler_x64.exe"
tApp = App_x86
tCmdLine = " /F"

Set WshShell = CreateObject("WScript.Shell")
Set FileObj = CreateObject("Scripting.FileSystemObject")
OSArch = WshShell.ExpandEnvironmentStrings("%PROCESSOR_ARCHITECTURE%")

If ((OSArch <> "x86") And (FileObj.FileExists(App_x64))) Then tApp=App_x64
If (FileObj.FileExists(tApp)) Then
	WshShell.Run(tApp + tCmdLine)
Else
	x=msgbox(tApp + " not found!" ,48, "www.sordum.org")
End If

Set WshShell = Nothing
Set FileObj = Nothing