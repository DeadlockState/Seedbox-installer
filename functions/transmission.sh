#!/bin/sh
install_transmission () {
	echo " "$step". Installing Transmission..."
	echo ""
	
	echo "Running apt-get install transmission-daemon ..."
	
	apt-get install -y transmission-daemon > /dev/null 2>&1
		
	step=$((step+1))
}

configure_transmission () {
	echo ""
	echo " "$step". Configuring Transmission..."
	echo ""
		
	sed -i 's/rpc-whitelist-enabled\": true/rpc-whitelist-enabled\": false/g' /etc/transmission-daemon/settings.json
		
	service transmission-daemon reload
		
	step=$((step+1))
}