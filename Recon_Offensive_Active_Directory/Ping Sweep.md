### Powershell ping sweep
```
1..254 | ForEach-Object {Get-WmiObject Win32_PingStatus -Filter "Address='192.168.1.$_' and Timeout=200 and ResolveAddressNames='true' and StatusCode=0" | select ProtocolAddress*}

```
