#!/bin/sh
install_couchpotato () {
	echo ""
	echo " "$step". Installing CouchPotato..."
	echo ""
	
	echo "Running apt-get install python-pip ..."
	
	apt-get install -y python-pip > /dev/null 2>&1
	
	echo "Running pip install --upgrade pyopenssl ..."
	
	pip install --upgrade pyopenssl > /dev/null 2>&1
	
	echo "Running pip install --upgrade pip ..."
	
	pip install --upgrade pip > /dev/null 2>&1
	
	cd /opt/
	
	echo "Running git clone https://github.com/CouchPotato/CouchPotatoServer.git ..."
 
	git clone https://github.com/CouchPotato/CouchPotatoServer.git --quiet
}

configure_couchpotato () {
	echo ""
	echo " "$step". Configuring CouchPotato..."
	echo ""
 
	cp CouchPotatoServer/init/ubuntu /etc/init.d/couchpotato
 
	cp CouchPotatoServer/init/ubuntu.default /etc/default/couchpotato
	
	sed -i 's/CP_USER=couchpotato/CP_USER=root/g' /etc/default/couchpotato
	
	sed -i 's/CP_HOME=/CP_HOME=\/opt\/CouchPotatoServer/g' /etc/default/couchpotato
	
	chmod +x /etc/init.d/couchpotato
	
	update-rc.d couchpotato defaults
	
	service couchpotato start
	
	cd CouchPotatoServer/couchpotato/core/helpers/
	
	wget https://raw.githubusercontent.com/Snipees/couchpotato.providers.french/master/namer_check.py --quiet
	
	cd /var/opt/couchpotato/
	
	mkdir custom_plugins/ && cd custom_plugins/
	
	mkdir cpasbien t411 torrent9 && cd cpasbien/
	
	wget https://raw.githubusercontent.com/Snipees/couchpotato.providers.french/master/cpasbien/__init__.py --quiet
	
	wget https://raw.githubusercontent.com/Snipees/couchpotato.providers.french/master/cpasbien/main.py --quiet
	
	cd ../t411/
	
	wget https://raw.githubusercontent.com/Punk--Rock/couchpotato.providers.french/master/t411/__init__.py --quiet
	
	wget https://raw.githubusercontent.com/Punk--Rock/couchpotato.providers.french/master/t411/main.py --quiet
	
	cd ../torrent9/
	
	wget https://raw.githubusercontent.com/Punk--Rock/couchpotato.providers.french/master/torrent9/__init__.py --quiet
	
	wget https://raw.githubusercontent.com/Punk--Rock/couchpotato.providers.french/master/torrent9/main.py --quiet
	
	service couchpotato restart
}
