#!/bin/sh
update_upgrade_system () {
	echo ""
	echo " "$step". Updating system..."
	echo ""
	
	echo "Running apt-get update && apt-get upgrade && apt-get dist-upgrade ..."
	
	apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y > /dev/null 2>&1
	
	apt-get install -y curl git-core unzip > /dev/null 2>&1
	
	step=$((step+1))
}