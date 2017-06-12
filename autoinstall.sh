#!/bin/sh
if [ $USER != "root" ] ; then
	echo ""
	echo " This script must be run as root !"
	echo ""
	
	exit
fi

if ! ping -c 1 google.com >> /dev/null 2>&1 ; then
	echo ""
	echo " You are not connected to internet please check your connection !"
	echo ""
	
	exit
fi

apt-get install -y git-core > /dev/null 2>&1

mkdir Seedbox-installer

git clone https://github.com/Punk--Rock/Seedbox-installer.git Seedbox-installer --quiet

mv Seedbox-installer/* .

rm -rf Seedbox-installer/

rm README.md

chmod +x seedbox.sh

clear
		
dir=`echo "$PWD" | sed -e "s/\/root/~/g"`

echo $USER"@"$(hostname)":"$dir"# ./seedbox.sh"

./seedbox.sh

rm autoinstall.sh*
