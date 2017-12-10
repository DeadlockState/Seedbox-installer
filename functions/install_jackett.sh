#!/bin/sh
install_jackett () {
	echo " "$step". Installing Jackett..."
	echo ""
	
	echo "Running apt-get install libcurl4-openssl-dev bzip2 mono-devel ..."
	
	apt-get install -y --allow-unauthenticated libcurl4-openssl-dev bzip2 mono-devel > /dev/null 2>&1
	
	cd /opt/
	
	wget https://github.com/Jackett/Jackett/releases/download/v0.8.500/Jackett.Binaries.Mono.tar.gz --quiet
	
	tar -zxf Jackett.Binaries.Mono.tar.gz
	
	rm Jackett.Binaries.Mono.tar.gz
	
	chmod -R 755 Jackett/
	
	cd /lib/systemd/system/
	
	wget https://raw.githubusercontent.com/Punk--Rock/Configuration-files/master/jackett/jackett.service --quiet
	
	systemctl enable jackett
	
	systemctl start jackett
	
	step=$((step+1))
}
