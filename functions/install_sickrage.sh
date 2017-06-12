#!/bin/sh
install_sickrage () {
	echo " "$step". Installing SickRage..."
	echo ""

	echo "Running apt-get install unrar-free openssl libssl-dev python2.7 ..." 
	
	apt-get install -y unrar-free openssl libssl-dev python2.7 > /dev/null 2>&1
	
	addgroup --system sickrage
	
	adduser --disabled-password --system --home /var/lib/sickrage --gecos "SickRage" --ingroup sickrage sickrage
	
	mkdir /opt/sickrage
	
	chown sickrage:sickrage /opt/sickrage
	
	echo "Running git clone https://github.com/SickRage/SickRage.git ..."
	
	git clone https://github.com/SickRage/SickRage.git /opt/sickrage --quiet
	
	cp /opt/sickrage/runscripts/init.ubuntu /etc/init.d/sickrage
	
	chown root:root /etc/init.d/sickrage
	
	chmod 644 /etc/init.d/sickrage
	
	chmod +x /etc/init.d/sickrage
	
	update-rc.d sickrage defaults
	 
	service sickrage start
	
	step=$((step+1))
}
