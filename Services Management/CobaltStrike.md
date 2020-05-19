```
sudo useradd -r Cobalt
sudo nano /etc/systemd/system/CobaltStrike.service
chmod 744 /etc/systemd/system/CobaltStrike.service

[Unit]
Description=Cobalt Strike Framework
After=network.target

[Service]
WorkingDirectory=/opt/CobaltStrike
User=Cobalt
Environment='STDOUT=/var/log/CobaltStrike/CobaltStrike.log'
Environment='STDERR=/var/log/CobaltStrike/CobaltStrike.log'
PIDFile=/var/run/Service.sh
ExecStart=/bin/sh -c "/opt/CobaltStrike/Service.sh >>${STDOUT} 2>>${STDERR}"

[Install]
WantedBy=multi-user.target
Alias=CobaltStrike.service
```
```
#Create the log directory and give our user permission:
mkdir /var/log/CobaltStrike
sudo chown -R Cobalt:Cobalt /opt/CobaltStrike/Service.sh /var/log/CobaltStrike/

#Give our user permission to launch the service on TCP ports:
sudo setcap cap_net_bind_service=+ep /opt/CobaltStrike/Service.sh

sudo systemctl daemon-reload
sudo systemctl start CobaltStrike.service
sudo systemctl enable CobaltStrike
sudo systemctl status CobaltStrike.service
```
