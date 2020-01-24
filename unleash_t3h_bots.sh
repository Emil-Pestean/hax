#!/bin/bash

##############################################################
# This is a script to help with fast install of a new server #
# This will install: nginx, apache2, mysql, redis-server     #
# Made by: CyberRat                                          #
##############################################################


# 1. Check for OS type
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	OS=$(lsb_release -si)
	VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	OS=$DISTRIB_ID
	VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	OS=Debian
	VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
	# Older SuSE/etc.
	...
elif [ -f /etc/redhat-release ]; then
	# Older Red Hat, CentOS, etc.
	...
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	OS=$(uname -s)
	VER=$(uname -r)
fi

if [ $NAME == "Ubuntu" ]; then
	# Install nginx, apache2, mysql, redis-server
	sudo apt install -y nginx apache2 redis-server mariadb-server
	
	# Start MYSQL
	sudo service mysql start

	# Secure mysql
	sudo mysql_secure_installation

	# Start apache2
	sudo service apache2 start

	# Start nginx
	sudo service nginx start

	# Start redis
	sudo service redis-server start
fi
