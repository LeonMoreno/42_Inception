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

	wp core download --path=/var/www/html/wordpress --locale=es_CO
	cd /var/www/html/wordpress
	wp config create --dbhost=$MYSQL_HOSTNAME --dbname=$WP_DB_NAME \
	       	--dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD
	#wp db install
	wp core install --url=$DOMAIN_NAME/wordpress --title="WP Inceptions" \
	       	--admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL
# 	wp theme install ryu --activate --allow-root

# 	# redis
#     sed -i "40i define('WP_REDIS_HOST', '$REDIS_HOST');" wp-config.php
#     sed -i "41i define('WP_REDIS_PORT', 6379);" wp-config.php
#     sed -i "42i define('WP_REDIS_PASSWORD', '$REDIS_PWD');" wp-config.php
#     sed -i "43i define('WP_REDIS_TIMEOUT', 1);" wp-config.php
#     sed -i "44i define('WP_REDIS_READ_TIMEOUT', 1);" wp-config.php
#     sed -i "45i define('WP_REDIS_DATABASE', 0);\n" wp-config.php
# 	sed -i "46i define('WP_CACHE', true);" wp-config.php
# 	#sed -i "47i define('WP_CACHE_KEY_SALT', 'dpoveda.42.fr');" wp-config.php
# 	# install redir plugin to wordpress
#     wp plugin install redis-cache --activate --allow-root

# 	# update plugins
#     wp plugin update --all --allow-root

# 	echo "[INFO] wordpress installation finished"
# 	touch /var/www/html/$WP_FILE_ONINSTALL
fi

# # enable redis
# wp redis enable --allow-root

# echo "[INFO] starting php-fpm..."
# mkdir -p /var/run/php-fpm7
#php-fpm7 -R --nodaemonize
php-fpm7 --nodaemonize
