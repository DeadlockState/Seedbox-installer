#!/bin/sh
install_plexmediaserver () {
	echo ""
	echo " "$step". Installing Plex Media Server..."
	echo ""

	cd /tmp/
 
	wget https://downloads.plex.tv/plex-media-server/1.10.0.4523-648bc61d4/plexmediaserver_1.10.0.4523-648bc61d4_amd64.deb --quiet
	
	# Little fix for containers/LXC running on Ubuntu Server
	mv /sbin/udevadm /sbin/udevadm.bak
	
	touch /sbin/udevadm
	
	chmod +x /sbin/udevadm
	# Little fix for containers/LXC running on Ubuntu Server
	
	dpkg -i plexmediaserver_1.10.0.4523-648bc61d4_amd64.deb
	
	# Little fix for containers/LXC running on Ubuntu Server
	rm /sbin/udevadm
	
	mv /sbin/udevadm.bak /sbin/udevadm
	# Little fix for containers/LXC running on Ubuntu Server
	
	step=$((step+1))
}
