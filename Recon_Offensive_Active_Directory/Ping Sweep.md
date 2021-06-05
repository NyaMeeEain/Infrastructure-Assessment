### Powershell ping sweep
```
1..254 | ForEach-Object {Get-WmiObject Win32_PingStatus -Filter "Address='192.168.1.$_' and Timeout=200 and ResolveAddressNames='true' and StatusCode=0" | select ProtocolAddress*}

```
### Window
```
for /L %i in (1,1,255) do @ping -n 1 -w 200 192.168.1.%i > nul && echo 192.168.1.%i is up

```
