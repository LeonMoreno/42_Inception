#!/bin/sh

# How to do
# https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html
# https://make.wordpress.org/cli/handbook/how-to/how-to-install/

# wait until database is ready
while ! mariadb -h$MYSQL_HOSTNAME -u$WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME --silent; do
	echo "[INFO] waiting for db..."
	sleep 2;
done

# check if wordpress is installed
if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "[INFO] installing wordpress..."

	wp core download --path=/var/www/html --locale=es_CO

	# wp core install --url=$DOMAIN_NAME/wordpress --title="WP Inceptions" \
	#        	--admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL

	wp config create --allow-root \
                    --dbname=$WP_DB_NAME \
                    --dbuser=$WP_DB_USER \
                    --dbpass=$WP_DB_PASSWORD \
                    --dbhost=$MYSQL_HOSTNAME \
                    --dbcharset="utf8" \
                    --dbcollate="utf8_general_ci" \
                    --path="/var/www/html"
    wp core install --allow-root \
                    --title="WP Incepcion" \
                    --admin_name=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASS \
                    --admin_email=$WP_ADMIN_MAIL \
                    --skip-email \
                    --url=$DOMAIN_NAME/wordpress \
                    --path="/var/www/html"
    wp user create --allow-root \
                    $WP_USER \
                    $WP_USER_MAIL \
                    --role=author \
                    --user_pass=$WP_USER_PASS \
                    --path="/var/www/html"

    echo "WP Installed"



fi

# # enable redis
# wp redis enable --allow-root

# echo "[INFO] starting php-fpm..."
# mkdir -p /var/run/php-fpm7
#php-fpm7 -R --nodaemonize
php-fpm7 --nodaemonize
