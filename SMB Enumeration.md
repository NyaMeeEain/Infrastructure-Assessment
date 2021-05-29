### SMB Enumeration

```
cat user.txt | grep "user:" | cut -d"[" -f 2 | cut -d "]" -f 1 > user.txt
for target in $(cat user.txt); do crackmapexec smb --shares $target; done

 for Mw in $(cat user.txt); do nmblookup -A $Mw; done
 for Me in $(cat user.txt); do smbclient -U '' -N -L //$Me; done
 for Me in $(cat user.txt); do smbmap -H $Me; done
```
