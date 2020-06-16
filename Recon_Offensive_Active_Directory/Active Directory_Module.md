### Active Directory_Module Hunt Down
```
powershell [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
powershell ([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships()
powershell [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest() 
powershell ([System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()).GetAllTrustRelationships() 
powershell ([adsisearcher]"(&(objectClass=User)(samaccountname=*))").FindAll().Properties.samaccountname #Get all existing Users
powershell ([adsisearcher]"(&(objectClass=User)(admincount=1))").FindAll().Properties.samaccountname # Get a list of Domain Admin

```
