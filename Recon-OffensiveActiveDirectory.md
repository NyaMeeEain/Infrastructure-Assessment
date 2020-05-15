### Recon OffensiveActiveDirectory
```
PowerShell Get-NetUser | Format-Table name, samaccountname, userprincipalname, description
Get-NetUser -Credential $Cred | Format-Table name, samaccountname, userprincipalname, description
```
### Domain Group Members Enumeration
```
To enumerate members of the Domain Admins group
powershell Get-DomainGroup *admin* -Properties samaccountname | Get-DomainGroupMember  | select -ExpandProperty GroupName
powershell Get-DomainGroupMember "Domain Admins"
powershell Get-DomainGroupMember  "Enterprise Admins"
powershell Get-DomainGroupMember "Enterprise Admins" –Domain acmebank.local
powershell Get-DomainGroup *admin* -Properties samaccountname | Get-DomainGroupMember
```
