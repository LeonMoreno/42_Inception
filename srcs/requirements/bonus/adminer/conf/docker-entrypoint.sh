#!/bin/sh

# How to do

# check if adminer is installed
if [ ! -f "/var/www/adminer/adminer.php" ]; then

    echo "[INFO] installing adminer..."
	cd /var/www/adminer
    wget "http://www.adminer.org/latest.php"
    mv latest.php adminer.php
fi

php-fpm7 --nodaemonize
