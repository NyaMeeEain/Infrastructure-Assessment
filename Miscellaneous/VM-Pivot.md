```
netsh interface ip set address "Ethernet1" static 192.168.152.101 255.255.255.0 192.168.152.100
route add -p 10.8.0.0 mask 255.255.255.0 192.168.152.100
route add -p 10.9.0.0 mask 255.255.255.0 192.168.152.100
route add -p 10.10.110.0 mask 255.255.255.0 192.168.152.100
Add-Content C:\Windows\System32\drivers\etc\hosts "192.168.152.100 kali"
```
```
sudo apt -y install iptables-persistent netfilter-persistent python3-pip
sudo systemctl disable network-manager.service
echo -en "\n\nauto eth0\niface eth0 inet dhcp\nauto eth1\niface eth1 inet static\n\taddress 192.168.152.100\n\tnetmask 255.255.255.0" | sudo tee -a /etc/network/interfaces
sudo service networking restart
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo netfilter-persistent save
sudo systemctl enable netfilter-persistent.service
sudo sed -i "s/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g" /etc/sysctl.conf

```
