#!/bin/sh
install_sonarr () {
	echo " "$step". Installing Sonarr..."
	echo ""
	
	apt-key adv –keyserver hkp://keyserver.ubuntu.com:80 –recv-keys3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF > /dev/null 2>&1
	
	echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list > /dev/null 2>&1
	
	apt-key adv –keyserver keyserver.ubuntu.com –recv-keys FDA5DFFC > /dev/null 2>&1
	
	echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list > /dev/null 2>&1
	
	echo "Running apt-get install libmono-cil-dev mediainfo ..."
	
	apt-get update -y > /dev/null 2>&1
	
	apt-get install -y --allow-unauthenticated libmono-cil-dev mediainfo > /dev/null 2>&1
	
	apt-get install -y --allow-unauthenticated nzbdrone
	
	cd /lib/systemd/system/
	
	wget https://raw.githubusercontent.com/Punk--Rock/Configuration-files/master/sonarr/sonarr.service --quiet
	
	systemctl enable sonarr
	
	systemctl start sonarr
	
	step=$((step+1))
}