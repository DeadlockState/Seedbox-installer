#!/bin/sh
show_result () {
	ip_address=`hostname -I  | sed -e "s/ //g"`
	
	echo ""
	echo " That's okay !"
	echo ""
	echo " Plex Media Server : "${blue}"http://"$ip_address":32400/web/index.html"${nc}
	if [ "$install_searchers" = "y" ] ; then
		echo " SickRage : "${blue}"http://"$ip_address":8081/home/"${nc}
		echo " CouchPotato : "${blue}"http://"$ip_address":5050"${nc}
	else
		echo " Sonarr : "${blue}"http://"$ip_address":8989"${nc}
		echo " Radarr : "${blue}"http://"$ip_address":7878"${nc}
	fi
	if [ "$install_torrent" = "r" ] ; then
		echo " ruTorrent : "${blue}"http://"$ip_address"${nc}   (username : "$rutorrent_user" / password : "$rutorrent_password")"
	else
		echo " Transmission : "${blue}"http://"$ip_address":9091/transmission/web/${nc}   (username/password : transmission)"
	fi
	echo " Jackett : "${blue}"http://"$ip_address":9117/UI/Dashboard"${nc}
	echo " PlexPy : "${blue}"http://"$ip_address":8181"${nc}
	echo ""
}
