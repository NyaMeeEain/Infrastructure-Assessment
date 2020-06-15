```
powershell get-item function:
Get-Process | Where-Object {$_.ProcessName –eq "explorer"}
Get-Process | ? {$_.ProcessName –eq “explorer”} | select Id,Handles
(Get-Process | ? {$_.ProcessName –eq “explorer”}).Id
```
