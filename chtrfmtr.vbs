Option Explicit

Dim shell, fso, scriptPath
Set shell = CreateObject("WScript.Shell")
Set fso   = CreateObject("Scripting.FileSystemObject")

scriptPath = fso.GetParentFolderName(WScript.ScriptFullName) & "\chtrfmtr.ps1"

' Launch PowerShell silently
shell.Run "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File """ & scriptPath & """", 0, False
