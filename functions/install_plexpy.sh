#!/bin/sh
install_plexpy () {
	echo ""
	echo " "$step". Installing PlexPy..."
	echo ""
	
	echo "Running apt-get install python ..."
	
	apt-get install -y python > /dev/null 2>&1
	
	cd /opt/
	
	echo "Running git clone https://github.com/JonnyWong16/plexpy.git ..."
	
	git clone https://github.com/JonnyWong16/plexpy.git --quiet
	
	adduser --system --group --disabled-login plexpy --shell /bin/nologin --quiet
	
	chown -R plexpy:plexpy plexpy/
	
	echo "HP_USER=plexpy      #$RUN_AS, username to run plexpy under, the default is plexpy
# HP_HOME=          #$APP_PATH, the location of PlexPy.py, the default is /opt/plexpy
# HP_DATA=          #$DATA_DIR, the location of plexpy.db, cache, logs, the default is /opt/plexpy
# HP_PIDFILE=       #$PID_FILE, the location of plexpy.pid, the default is /var/run/plexpy/plexpy.pid
# PYTHON_BIN=       #$DAEMON, the location of the python binary, the default is /usr/bin/python
# HP_OPTS=          #$EXTRA_DAEMON_OPTS, extra cli option for plexpy, i.e. \" --config=/home/plexpy/config.ini\"
# SSD_OPTS=         #$EXTRA_SSD_OPTS, extra start-stop-daemon option like \" --group=users\"
HP_PORT=8181        #$PORT_OPTS, default is 8181 for the webserver, overrides value in config.ini" > /etc/default/plexpy
	
	cp /opt/plexpy/init-scripts/init.ubuntu /etc/init.d/plexpy
	
	chmod +x /etc/init.d/plexpy
	
	update-rc.d plexpy defaults
	
	service plexpy start
	
	step=$((step+1))
}
