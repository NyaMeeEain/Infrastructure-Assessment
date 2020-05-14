### Recon OffensiveActiveDirectory
```
PowerShell Get-NetUser | Format-Table name, samaccountname, userprincipalname, description
Get-NetUser -Credential $Cred | Format-Table name, samaccountname, userprincipalname, description
```
