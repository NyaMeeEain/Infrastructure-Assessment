### Active Directory_Module Hunt Down

### Get A list of Compuer
```
powershell ([adsisearcher]"objectclass=computer").FindAll().Properties.name
```
### User Identify
```
powershell [System.Security.Principal.WindowsIdentity]::GetCurrent() | Format-Table -auto
powershell ([adsisearcher]'(samaccountname=n.glover)').FindOne().Properties.memberof
powershell ([adsisearcher]'(samaccountname=n.glover)').FindAll()

```
###  Search for all users that do not have homedirectory attribute set
```
powershell ([adsisearcher]'(!homedirectory=*)').FindAll()
powershell ([adsisearcher]'(&(objectcategory=user)(!homedirectory=*))').FindAll()
powershell ([adsisearcher]'(&(objectcategory=user)(!homedirectory=*))').FindAll().Count
```


```
powershell [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
powershell ([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships()
powershell [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest() 
powershell ([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships() 
powershell ([adsisearcher]"(&(objectClass=User)(samaccountname=*))").FindAll().Properties.samaccountname #Get all existing Users
powershell ([adsisearcher]"(&(objectClass=User)(admincount=1))").FindAll().Properties.samaccountname # Get a list of Domain Admin

```
### Constrained Delegation
```
powershell Get-ADComputer -Filter {(msDS-AllowedToDelegateTo -ne "{}")} -Properties TrustedForDelegation,TrustedToAuthForDelegation,ServicePrincipalName,Description,msDS-AllowedToDelegateTo
```
