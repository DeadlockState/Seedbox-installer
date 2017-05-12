#!/bin/sh
install_radarr () {
	echo ""
	echo " "$step". Installing Radarr..."
	echo ""
	
	cd /opt/
	
	wget https://github.com/Radarr/Radarr/releases/download/v0.2.0.696/Radarr.develop.0.2.0.696.linux.tar.gz
	
	tar -zxf Radarr.develop.0.2.0.696.linux.tar.gz
	
	rm Radarr.develop.0.2.0.696.linux.tar.gz
	
	cd /lib/systemd/system/
	
	wget https://raw.githubusercontent.com/Punk--Rock/Configuration-files/master/radarr/radarr.service --quiet
	
	systemctl enable radarr
	
	systemctl start radarr
	
	step=$((step+1))
}