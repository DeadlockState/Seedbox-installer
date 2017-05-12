#!/bin/sh
fix_locale () {
	echo ""
	echo " "$step". Fixing default locale problems with LXC containers..."
	echo ""
	
	locale-gen en_US en_US.UTF-8
	
	step=$((step+1))
}