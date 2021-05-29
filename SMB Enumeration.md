### SMB Enumeration

```
cat user.txt | grep "user:" | cut -d"[" -f 2 | cut -d "]" -f 1 > user.txt
for target in $(cat user.txt); do crackmapexec smb --shares $target; done

 for urt in $(cat user.txt); do nmblookup -A $urt; done
 for urt in $(cat user.txt); do smbclient -U '' -N -L //$urt; done
 for urt in $(cat user.txt); do smbmap -H $urt; done
```
