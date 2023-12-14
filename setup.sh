# Télécharge le script dhclient depuis GitHub
wget https://raw.githubusercontent.com/SammuelLeroux/askDHCP/master/dhclient_script.sh

# Rend le script dhclient exécutable
chmod +x dhclient_script.sh

# Crée le service systemd
cat <<EOF > /etc/systemd/system/dhclient.service
[Unit]
Description=DHCP Client on enp0s8
After=network.target

[Service]
ExecStart=/path/to/your/script/dhclient_script.sh
Restart=always
RestartSec=3
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=dhclient-service

[Install]
WantedBy=multi-user.target
EOF

# Active et démarre le service
systemctl enable dhclient.service
systemctl start dhclient.service