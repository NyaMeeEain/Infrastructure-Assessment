### Get list of users in the current Domain

```
PowerShell Get-NetUser | select cn
Powershell Get-NetUser -Identity John
PowerShell Get-NetUser | Format-Table name, samaccountname, userprincipalname, description
Get-NetUser -Credential $Cred | Format-Table name, samaccountname, userprincipalname, description
```
### Get a list of computers in the current Domain
```
powershell Get-DomainComputer | select cn,objectsid,dnshostname
powershell Get-NetComputer -OperatingSystem "*Server 2016*" | select operatingsystem,lastlogon,dnshostname
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
### DomainPolicy
```
Get-DomainPolicy  -Domain acmebank.local
powershell Get-DomainPolicy -Source DC -Domain acmebank.local
```
