#!/bin/sh

# How to do
# https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html
# https://make.wordpress.org/cli/handbook/how-to/how-to-install/

# wait until database is ready
MAX_ATTEMPTS=30
ATTEMPTS=0

while ! mariadb -h$MYSQL_HOSTNAME -u$WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME --silent; do
	echo "[INFO] waiting for db..."
	sleep 5;

    ATTEMPTS=$((ATTEMPTS + 1))

    if [ $ATTEMPTS -eq $MAX_ATTEMPTS ]; then
        echo "[ERROR] Database not ready after $MAX_ATTEMPTS attempts. Exiting."
        exit 1
    fi
done

# check if wordpress is installed
if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "[INFO] installing wordpress..."

    # Descargar WordPress
	wp core download --path=/var/www/html/ --locale=es_CO 

	# wp core install --url=$DOMAIN_NAME/wordpress --title="WP Inceptions" \
	#        	--admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL

    # Crear archivo de configuración
	wp config create --allow-root \
                    --dbname=$WP_DB_NAME \
                    --dbuser=$WP_DB_USER \
                    --dbpass=$WP_DB_PASSWORD \
                    --dbhost=$MYSQL_HOSTNAME \
                    --dbcharset="utf8" \
                    --dbcollate="utf8_general_ci" \
                    --path="/var/www/html/"

    # Instalar WordPress
    wp core install --allow-root \
                    --title="WP Incepcion" \
                    --admin_name=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASS \
                    --admin_email=$WP_ADMIN_MAIL \
                    --skip-email \
                    --url=$DOMAIN_NAME/ \
                    --path="/var/www/html/"
    # Crear usuario
    wp user create --allow-root \
                    $WP_USER \
                    $WP_USER_MAIL \
                    --role=author \
                    --user_pass=$WP_USER_PASS \
                    --path="/var/www/html/"

    # Instalar y configurar plugin Redis Cache
    wp plugin install redis-cache --activate --allow-root
    echo "define('WP_REDIS_HOST','$WP_REDIS_HOST');" >> /var/www/html/wp-config.php
    echo "define('WP_CACHE', true);" >> /var/www/html/wp-config.php

    #Para Debug
    echo "define('WP_DEBUG', true);" >> /var/www/html/wp-config.php
    echo "define('WP_DEBUG_LOG', true);" >> /var/www/html/wp-config.php
    echo "define('WP_DEBUG_DISPLAY', false);" >> /var/www/html/wp-config.php

    echo "[INFO] WP Installed"
fi

# enable redis
# wp redis enable --allow-root

# Iniciar php-fpm7 en segundo plano
php-fpm7 --nodaemonize
