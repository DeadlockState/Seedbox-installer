#!/bin/sh
. functions/functions.sh

green="\033[0;32m"
blue="\033[0;36m"
orange="\033[0;33m"
red="\033[1;31m"
nc="\033[0m"

if [ $USER = "root" ] ; then
	if ping -c 2 google.com >> /dev/null 2>&1 ; then
		step=1
		
		fix_locale
		
		update_upgrade_system
		
		install_plexmediaserver
		
		echo ""
		read -p " As default Sonarr and Radarr will be installed. Do you prefer install Sickrage and CouchPotato ? [y/N] " install_searchers
		echo ""
		
		if [ "$install_searchers" = "y" ] ; then
			install_sickrage
			
			install_couchpotato
			
			configure_couchpotato
		else
			install_sonarr
		
			install_radarr
		fi
		
		echo ""
		read -p " Would you like install rTorrent + ruTorrent or Transmission ? [r/T] " install_torrent
		echo ""
		
		if [ "$install_torrent" = "r" ] ; then
			install_rtorrent_rutorrent
			
			configure_rutorrent
			
			configure_nginx_rutorrent
			
			configure_user_rtorrent_rutorrent
			
			configure_rtorrent_service
		else
			install_transmission
			
			configure_transmission
		fi
		
		install_jackett
		
		install_plexpy
		
		show_result
	else
		echo ""
		echo " You are not connected to internet please check your connection !"
		echo ""
	fi
else
	echo ""
	echo "You are not root :("
	echo ""
fi