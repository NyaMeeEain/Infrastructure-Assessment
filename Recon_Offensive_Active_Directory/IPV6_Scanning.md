### Local IPv6  Enumeration

```
ping6 -c4 -I eth0 ff02::1 | tee ipv6
cat ipv6 | cut -d" " -f4 | sort -u | grep fe | sed s'/:$//' | tee Targeted.txt
nmap -6 -T4 -Pn -open -sSVC -A –p0-65535 -iL Targeted.txt

```
