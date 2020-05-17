```
mkdir /opt/gophish
curl -L https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip -o gophish-v0.9.0-linux-64bit.zip
unzip gophish-v0.9.0-linux-64bit.zip -d /opt/gophish/
sed -i 's!127.0.0.1!0.0.0.0!g' /opt/gophish/config.json


sudo useradd -r gophish
sudo nano /etc/systemd/system/gophish.service

[Unit]
Description=Gophish Open-Source Phishing Framework
After=network.target

[Service]
WorkingDirectory=/opt/gophish
User=gophish
Environment='STDOUT=/var/log/gophish/gophish.log'
Environment='STDERR=/var/log/gophish/gophish.log'
PIDFile=/var/run/gophish
ExecStart=/bin/sh -c "/opt/gophish/gophish >>${STDOUT} 2>>${STDERR}"

[Install]
WantedBy=multi-user.target
Alias=gophish.service

#Create the log directory and give our user permission:
mkdir /var/log/gophish
sudo chown -R gophish:gophish /opt/gophish/ /var/log/gophish/

#Give our user permission to launch the service on TCP ports:
sudo setcap cap_net_bind_service=+ep /opt/gophish/gophish

#we're going to add the service, start the service, enable the service, and check the status of the service. 
sudo systemctl daemon-reload
sudo systemctl start gophish
sudo systemctl enable gophish
sudo systemctl status gophish

```
