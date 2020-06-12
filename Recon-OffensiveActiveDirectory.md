### Get list of users in the current Domain

```
PowerShell Get-NetUser | select cn
Powershell Get-NetUser -Identity John
Powershell Get-NetUser -Identity n.glover | select msexchhomeservername,userprincipalname,primarygroupid,homedrive,homedirectory | fl
PowerShell Get-NetUser | select userprincipalname,userprincipalname,homedirectory,serviceprincipalname
PowerShell Get-NetUser | Format-Table name, samaccountname, userprincipalname, description
Get-NetUser -Credential $Cred | Format-Table name, samaccountname, userprincipalname, description
```
### Get a list of computers in the current Domain
```
powershell Get-DomainComputer | select cn,objectsid,dnshostname
PowerShell Find-DomainUserLocation | Select-Object UserName, SessionFromName # Identify Each user Sesson On Network
PowerShell Get-DomainComputer -Properties DnsHostName | Sort-Object -Property DnsHostName
powershell Get-NetComputer -OperatingSystem "*Server 2016*" | select operatingsystem,lastlogon,dnshostname
```
### Figure out The Domain Administator GroupMember
```
powershell Get-DomainGroupMember -identity *admin* -recurse | select -exp membername
powershell Get-DomainGroup *admin* -Properties samaccountname | Get-DomainGroupMember | select MemberDomain,GroupName,MemberName
powershell Get-DomainGroup *admin* -Properties samaccountname | Get-DomainGroupMember | select MemberDomain,GroupName,MemberName | fl
```
### Unconstrained Delegation
```
powershell Get-DomainComputer -Unconstrained | select -exp dnshostname
powershell Get-DomainComputer -Unconstrained | select samaccountname,dnshostname,operatingsystem,useraccountcontrol
powershell Get-DomainComputer -Unconstrained | select samaccountname,dnshostname,useraccountcontrol,dnshostname,operatingsystem
powershell Get-DomainGPOLocalGroup
powershell Get-DomainGPOLocalGroup | select GroupName,GPODisplayName,GPOType
powershell Get-DomainGPOLocalGroup | select GroupName,GPODisplayName,GPOType,GPOName
powershell Get-DomainOU -GPLink '{A572138C-69A5-4A6B-8210-FE08E6B0282D}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Get-DomainOU -GPLink '{66465373-16CB-4F96-BD3A-12AE7D2C2371}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Get-DomainOU -GPLink '{8D791281-636D-400A-B495-C9B32753F717}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Get-DomainGroupMember -identity *admin* -recurse | select -exp membername
powershell Find-DomainUserLocation -userIdentity 'w.schneider' # Figure out The Location of Each Member system


```
### DomainGPO
```
powershell Get-DomainGPOLocalGroup
powershell Get-DomainGroupMember -identity 'Workstation Admins' -recurse | select -exp membername 
powershell Get-DomainGroupMember -identity 'Helpdesk\Admins' -recurse | select -exp membername 
PowerShell Get-DomainGPO -Properties DisplayName | Sort-Object -Property DisplayName
PowerShell Get-DomainGPO -ComputerIdentity wkstn-1555 -Properties DisplayName | Sort-Object -Property DisplayName
PowerShell Get-DomainGPOLocalGroup | Select-Object GPODisplayName, GroupName
```

### DomainOU
```
 PowerShell Get-DomainOU -Properties Name | Sort-Object -Property Name
 
```
### DomainGPOLocalGroup

```
powershell Get-DomainGPOLocalGroup
powershell Get-DomainGroupMember -identity 'Workstation Admins' -recurse | select -exp membername 
powershell Get-DomainGroupMember -identity 'Helpdesk\Admins' -recurse | select -exp membername  
powershell Get-DomainOU -GPLink '{66465373-16CB-4F96-BD3A-12AE7D2C2371}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Find-DomainUserLocation -userIdentity 'Workstation\Admins' 
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



