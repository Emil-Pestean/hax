#!/bin/bash

echo "Would you like create and configure an nginx proxy?"
read nginx_config_confirm

if [ $nginx_config_confirm == "y" ]; then
	echo "Configuring nginx..."

	echo "Please input "
fi
