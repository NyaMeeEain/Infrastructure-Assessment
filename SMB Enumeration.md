### SMB Enumeration

```
cat user.txt | grep "user:" | cut -d"[" -f 2 | cut -d "]" -f 1 > user.txt
for target in $(cat user.txt); do crackmapexec smb --shares $target; done
```
