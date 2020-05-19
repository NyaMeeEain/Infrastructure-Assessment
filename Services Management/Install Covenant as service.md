```
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2

git clone --recurse-submodules https://github.com/cobbr/Covenant
cd Covenant/Covenant
dotnet build


sudo useradd -r Covenant
sudo nano /etc/systemd/system/Covenant.service
chmod 744 /etc/systemd/system/Covenant.service

[Unit]
Description=Covenant Framework
After=network.target

[Service]
WorkingDirectory=/opt/Covenant
User=Covenant
Environment='STDOUT=/var/log/Covenant/Covenant.log'
Environment='STDERR=/var/log/Covenant/Covenant.log'
PIDFile=/var/run/Covenant.sh
ExecStart=/bin/sh -c "/opt/Covenant/Covenant.sh >>${STDOUT} 2>>${STDERR}"

[Install]
WantedBy=multi-user.target
Alias=Covenant.service

```

```
#Create the log directory and give our user permission:
mkdir /var/log/Covenant
sudo chown -R Covenant:Covenant /opt/Covenant/Covenant.sh/ /var/log/Covenant/

#Give our user permission to launch the service on TCP ports:
sudo setcap cap_net_bind_service=+ep /opt/Covenant/Covenant.sh

sudo systemctl daemon-reload
sudo systemctl start Covenant
sudo systemctl enable Covenant
sudo systemctl status Covenant

```

