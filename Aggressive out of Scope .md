### Aggressive out of Scope Scanning
Occasionally clients provided  a range of Ip Addess list,which containing  out of Scope, to scan entire network.in this case I alwasy utilize Iptable to block OUTgoing tcp and udp traffic.

### Out of Scope of Ip Address range stop sending TCP Packets.
```
iptables -A OUTPUT --match iprange --dst-range  192.168.1.1-192.168.1.107  -j DROP

```
### Allowing speficAddress range income
```
iptables -A INPUT  --match iprange --dst-range  192.168.1.100-192.168.1.254  -j ACCEPT
```

### IpV6
```
ip6tables -A OUTPUT  -m iprange --dst-range 2001:db8::1-2001:db8::ff -j DROP
```
### Null Route
```
ip route add blackhole 192.168.1.0/25 #192.168.1.1 - 192.168.1.126
ip route add blackhole 192.168.1.0/26 #192.168.1.1 - 192.168.1.62
ip route add blackhole 192.168.1.0/27 #192.168.1.1 - 192.168.1.30
ip route add blackhole 192.168.1.0/28 #192.168.1.1 - 192.168.1.14
ip route add blackhole 192.168.1.0/29 #192.168.1.1 - 192.168.1.6
```
