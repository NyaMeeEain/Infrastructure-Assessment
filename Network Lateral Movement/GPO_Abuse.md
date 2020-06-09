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
