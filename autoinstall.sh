#!/bin/sh
if [ $USER = "root" ] ; then
	if ping -c 2 google.com >> /dev/null 2>&1 ; then
		apt-get install -y git-core > /dev/null 2>&1
		
		mkdir Seedbox-installer
		
		git clone https://github.com/Punk--Rock/Seedbox-installer.git Seedbox-installer/ > /dev/null 2>&1
		
		mv Seedbox-installer/* .
		
		rm -rf Seedbox-installer/
		
		rm README.md
		
		chmod +x Seedbox.sh
		
		clear
		
		dir=`echo "$PWD" | sed -e "s/\/root/~/g"`
		
		echo $USER"@"$(hostname)":"$dir"# ./Seedbox.sh"
		
		./Seedbox.sh
		
		rm autoinstall.sh && rm autoinstall.sh.1
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
