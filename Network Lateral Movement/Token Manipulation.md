### Make Token
When a Windows account logs in, the system reads the account information from an internal database and then uses the information to generate an access token. Processes started in the account environment will get a copy of this token, and the threads in the process hold this token by default. When a thread wants to access an object or perform certain system management-related operations, Windows uses the token held by this thread to perform access checks on the other hand The security descriptor is associated with the object being accessed, it contains the SID of the owner of the object, and an access control list (ACL, Access Control List), which includes DACL (Discretionary Access Control List) and SACL (System Access Control List) -the exact translation of these two things is not yet known-of which, DACL is the most important in the security descriptor, which contains zero or more access control entries (ACE, Access Control Entry), The content of each access control item describes allowing or denying specific accounts to perform specific operations on this object. 
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
```
impersonateprocess 7775
steal_token 7777
```

### Named Pipes
named pipe is based on a simple SMB inter-process communication (Internet Process Connection - IPC ) mechanism. 
In computer programming, named pipes can support reliable, one-way, or two-way data communication between different processes on the same computer or between different processes on different computers across a network.
Unlike general pipelines, named pipelines can be called by different processes in different ways (cross-language and cross-platform).
As long as the program knows the name of the named pipe, any process can open the other end of the pipe by that name and communicate with the server process according to the given permissions.
https://rcoil.me/2019/11/%E3%80%90%E7%9F%A5%E8%AF%86%E5%9B%9E%E9%A1%BE%E3%80%91%E5%91%BD%E5%90%8D%E7%AE%A1%E9%81%93/



