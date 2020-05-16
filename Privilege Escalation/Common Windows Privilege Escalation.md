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

