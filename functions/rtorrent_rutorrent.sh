#!/bin/sh
install_rtorrent_rutorrent () {
	echo " "$step". Installing rTorrent/ruTorrent (with Nginx)..."
	echo ""

	echo "Running apt-get install automake libcppunit-dev libtool build-essential pkg-config libssl-dev libcurl4-openssl-dev libsigc++-2.0-dev libncurses5-dev screen subversion nginx apache2-utils php7.0 php7.0-fpm php7.0-cli php7.0-curl php-geoip php7.0-xmlrpc unrar rar zip ffmpeg buildtorrent mediainfo python-libtorrent rtorrent ..."
	
	apt-get install -y automake libcppunit-dev libtool build-essential pkg-config libssl-dev libcurl4-openssl-dev libsigc++-2.0-dev libncurses5-dev screen subversion nginx apache2-utils php7.0 php7.0-fpm php7.0-cli php7.0-curl php-geoip php7.0-xmlrpc unrar rar zip ffmpeg buildtorrent mediainfo python-libtorrent rtorrent > /dev/null 2>&1
 
	cd /var/www/html/
		 
	git clone https://github.com/Novik/ruTorrent.git rutorrent
		 
	cd rutorrent/plugins/
		 
	git clone https://github.com/xombiemp/rutorrentMobile.git mobile
		
	step=$((step+1))
}

configure_rutorrent () {
	echo ""
	echo " "$step". Configuring ruTorrent..."
	echo ""
		
	sed -i 's/$useExternal = false/$useExternal = '\''buildtorrent'\''/g' /var/www/html/rutorrent/plugins/create/conf.php
		
	sed -i 's/$pathToCreatetorrent = '\'''\''/$pathToCreatetorrent = '\''\/usr\/bin\/buildtorrent'\''/g' /var/www/html/rutorrent/plugins/create/conf.php
		
	step=$((step+1))
}

configure_nginx_rutorrent () {
	echo " "$step". Configuring Nginx and downloading server block for ruTorrent..."
	echo ""
		
	cd /etc/nginx/

	mv nginx.conf nginx.conf.default

	wget https://raw.githubusercontent.com/Punk--Rock/Configuration-files/master/nginx/nginx.conf --quiet
		
	cd sites-available/

	wget https://raw.githubusercontent.com/Punk--Rock/Configuration-files/master/nginx/sites-available/rutorrent.conf --quiet

	cd ../sites-enabled/

	rm default

	ln -s /etc/nginx/sites-available/rutorrent.conf
		
	sed -i 's/;date.timezone =/date.timezone = Europe\/Paris/g' /etc/php/7.0/fpm/php.ini
		
	read -p " What will be the username to access to ruTorrent ? [rutorrent] " rutorrent_user_temp
	echo ""
		
	if [ -z $rutorrent_user_temp ] ; then
		rutorrent_user="rutorrent"
	else
		rutorrent_user=$(echo "$rutorrent_user_TEMP" | tr -s '[:upper:]' '[:lower:]')
	fi
		
	read -p " and the password ? [rutorrent] " rutorrent_password
	
	if [ -z $rutorrent_password ] ; then
		rutorrent_password="rutorrent"
	fi
		
	sed -i 's/rutorrent_user/'$rutorrent_user'/g' /etc/nginx/sites-available/rutorrent.conf
		
	htpasswd -b -c /var/www/html/rutorrent/.htpasswd $rutorrent_user $rutorrent_password > /dev/null 2>&1
		
	chmod 400 /var/www/html/rutorrent/.htpasswd
		
	chown www-data:www-data /var/www/html/rutorrent/.htpasswd
		
	service nginx restart && service php7.0-fpm restart
		
	step=$((step+1))
}
	
configure_user_rtorrent_rutorrent () {
	echo ""
	echo " "$step". Configuring "$rutorrent_user" user for rTorrent and ruTorrent..."
	echo ""
		
	useradd $rutorrent_user
		
	cd /home/
		
	mkdir $rutorrent_user/ && cd $rutorrent_user/
		
	mkdir torrents watch .session
		
	touch .rtorrent.rc
		
	echo "scgi_port = 127.0.0.1:5001
encoding_list = UTF-8
port_range = 45000-65000
port_random = no
check_hash = no
directory = /home/"$rutorrent_user"/torrents
session = /home/"$rutorrent_user"/.session
encryption = allow_incoming, try_outgoing, enable_retry
schedule = watch_directory,1,1,\"load_start=/home/"$rutorrent_user"/watch/*.torrent\"
schedule = untied_directory,5,5,\"stop_untied=/home/"$rutorrent_user"/watch/*.torrent\"
use_udp_trackers = yes
dht = off
peer_exchange = no
min_peers = 40
max_peers = 100
min_peers_seed = 10
max_peers_seed = 50
max_uploads = 15
execute = {sh,-c,/usr/bin/php /var/www/html/rutorrent/php/initplugins.php "$rutorrent_user" &}
schedule = espace_disque_insuffisant,1,30,close_low_diskspace=500M" > .rtorrent.rc

	chown -R $rutorrent_user:$rutorrent_user /home/$rutorrent_user/
		
	chown root:root /home/$rutorrent_user/
		
	chmod 755 /home/$rutorrent_user/
		
	cd /var/www/html/rutorrent/conf/users/
		
	mkdir $rutorrent_user/ && cd $rutorrent_user/
		
	touch config.php
		
	echo "<?php
\$pathToExternals['curl'] = '/usr/bin/curl';
\$topDirectory = '/home/"$rutorrent_user"';
\$scgi_port = 5001;
\$scgi_host = '127.0.0.1';
\$XMLRPCMountPoint = '/"$rutorrent_user"';" > config.php
	
	chown -R www-data:www-data /var/www/html/
		
	service nginx restart
		
	step=$((step+1))
}

configure_rtorrent_service () {
	echo " "$step". Configuring rTorrent service..."
	echo ""
		
	cd /etc/init.d/
		
	touch rtorrent
		
	echo "#!/usr/bin/env bash

# Dépendance : screen, killall et rtorrent
### BEGIN INIT INFO
# Provides:          <username>-rtorrent
# Required-Start:    \$syslog \$network
# Required-Stop:     \$syslog \$network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Start-Stop rtorrent user session
### END INIT INFO

## Début configuration ##
user=\""$rutorrent_user"\"
## Fin configuration ##

rt_start() {
    su --command=\"screen -dmS \${user}-rtorrent rtorrent\" \"\${user}\"
}

rt_stop() {
    killall --user \"\${user}\" screen
}

case \"\$1\" in
start) echo \"Starting rtorrent...\"; rt_start
    ;;
stop) echo \"Stopping rtorrent...\"; rt_stop
    ;;
restart) echo \"Restart rtorrent...\"; rt_stop; sleep 1; rt_start
    ;;
*) echo \"Usage: \$0 {start|stop|restart}\"; exit 1
    ;;
esac
exit 0" > $rutorrent_user-rtorrent
		
	chmod +x $rutorrent_user-rtorrent
		
	update-rc.d $rutorrent_user-rtorrent defaults
		
	service $rutorrent_user-rtorrent start
	
	if [ "$install_searchers" = "y" ] ; then
		service sickrage restart
	fi
	
	step=$((step+1))
}
