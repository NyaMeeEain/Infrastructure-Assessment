

### Procdump - text in red
```
nmap -Pn -n --open -p3389  172.31.6.0/24
nmap -Pn -n --open -p500  192.168.0.0/24
nmap -Pn -n --open -p161  192.168.0.0/24
nmap -Pn -n --open -p6000-6005 --script=x11-access 172.31.6.0/24 
nmap -Pn -n --open -p3389 --script=rdp-vuln-ms12-020,rdp-enum-encryption 172.31.6.0/24
nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24
nmap -sT -PN -n -sV -p 21,22,23,25,80,110,139,443,445,1433,1521,3306,3389,8080,10000 192.168.2.9/24 | awk '/22\/open/ {print $2}'
```

```diff
- text in red
+ text in green
! text in orange
# text in gray
```