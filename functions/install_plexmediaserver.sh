#!/bin/sh
install_plexmediaserver () {
	echo ""
	echo " "$step". Installing Plex Media Server..."
	echo ""

	cd /tmp/
 
	wget https://downloads.plex.tv/plex-media-server/1.5.6.3790-4613ce077/plexmediaserver_1.5.6.3790-4613ce077_amd64.deb
	
	dpkg -i plexmediaserver_1.5.6.3790-4613ce077_amd64.deb
	
	step=$((step+1))
}