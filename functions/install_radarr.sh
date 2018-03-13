#!/bin/sh
install_radarr () {
	echo ""
	echo " "$step". Installing Radarr..."
	echo ""
	
	cd /opt/
	
	wget $(curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 ) --quiet
	
	tar -zxf Radarr.develop.*.linux.tar.gz
	
	rm Radarr.develop.*.linux.tar.gz
	
	cd /lib/systemd/system/
	
	wget https://raw.githubusercontent.com/Punk--Rock/Configuration-files/master/radarr/radarr.service --quiet
	
	systemctl enable radarr
	
	systemctl start radarr
	
	step=$((step+1))
}
