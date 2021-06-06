### SMB Enumeration

```
for /L %i in (1,1,255) do @ping -n 1 -w 200 192.168.1.%i > nul && echo 192.168.1.%i > user.txt
cat user.txt | grep "user:" | cut -d"[" -f 2 | cut -d "]" -f 1 > user.txt
for target in $(cat user.txt); do crackmapexec smb --shares $target; done

for Bagan in $(cat user.txt); do nmblookup -A $Bagan; done
for Bagan in $(cat user.txt); do smbclient -U '' -N -L //$Bagan; done
for Bagan in $(cat user.txt); do smbmap -H $Bagan; done
```
