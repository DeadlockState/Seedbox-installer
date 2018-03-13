#!/bin/sh
install_tautulli () {
	echo ""
	echo " "$step". Installing Tautulli..."
	echo ""
	
	echo "Running apt-get install python ..."
	
	apt-get install -y python > /dev/null 2>&1
	
	cd /opt/
	
	echo "Running git clone https://github.com/Tautulli/Tautulli.git ..."
	
	git clone https://github.com/Tautulli/Tautulli.git --quiet
	
	adduser --system --no-create-home tautulli --quiet
	
	chown -R tautulli:nogroup Tautulli
	
	chmod +x Tautulli/init-scripts/init.ubuntu

	ln -s /opt/Tautulli/init-scripts/init.ubuntu /etc/init.d/tautulli
	
	update-rc.d tautulli defaults
	
	service tautulli start
	
	step=$((step+1))
}
