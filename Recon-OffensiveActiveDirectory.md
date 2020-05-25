### Get list of users in the current Domain

```
PowerShell Get-NetUser | select cn
Powershell Get-NetUser -Identity John
PowerShell Get-NetUser | select userprincipalname,userprincipalname,homedirectory,serviceprincipalname
PowerShell Get-NetUser | Format-Table name, samaccountname, userprincipalname, description
Get-NetUser -Credential $Cred | Format-Table name, samaccountname, userprincipalname, description
```
### Get a list of computers in the current Domain
```
powershell Get-DomainComputer | select cn,objectsid,dnshostname
PowerShell Get-DomainComputer -Properties DnsHostName | Sort-Object -Property DnsHostName
powershell Get-NetComputer -OperatingSystem "*Server 2016*" | select operatingsystem,lastlogon,dnshostname
```

### DomainOU
```
 PowerShell Get-DomainOU -Properties Name | Sort-Object -Property Name
```
### DomainGPOLocalGroup
```
PowerShell Get-DomainGroup -Identity 'Domain Admins' | Select-Object -ExpandProperty Member
PowerShell Get-DomainGroupMember -Identity 'Domain Admins' | Select-Object MemberDistinguishedName 
PowerShell Get-DomainGPOLocalGroup | Select-Object GPODisplayName, GroupName
PowerShell Find-DomainUserLocation | Select-Object UserName, SessionFromName

```
### NetLocalGroupMember
```
PowerShell Get-NetLocalGroup | Select-Object GroupName
PowerShell Get-NetLocalGroupMember -GroupName Administrators | Select-Object MemberName, IsGroup, IsDomain
PowerShell Get-NetLoggedOn


```
### Net Session
```
PowerShell Get-NetSession -ComputerName fs-1 | Select-Object CName, UserName
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
Get-Domain | Select-Object -Expand name
Get-DomainPolicy  -Domain acmebank.local
powershell Get-DomainPolicy -Source DC -Domain acmebank.local
```
### Forest Manipulation and abusive

```
#Get a list of all Domain Trusts for the current Domain
Get-NetDomainTrust
Get-NetDomainTrust -Domain <domain>

#Get details about the current Forest
Get-NetForest
powershell Get-NetForest -Forest  acmebank.local

#Get all Domains in the current Forest
Get-NetForestDomain
Get-NetForestDomain -Forest acmebank.local
```



