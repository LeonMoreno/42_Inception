#! /bin/sh

DB_DIR=/var/lib/mysql/$WP_DB_NAME

# init wp_db && update root pass add creat user+pass
if [ -d $DB_DIR ]; then
  echo "$WP_DB_NAME IS ALREADY."
else
  echo "$WP_DB_NAME DOES NOT EXIST; CREATING $WP_DB_NAME"
  touch /tmp/db_init.sql
  echo "FLUSH PRIVILEGES;" > /tmp/db_init.sql
  echo "ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/db_init.sql
  echo "CREATE DATABASE $WP_DB_NAME;" >> /tmp/db_init.sql
  echo "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';" >> /tmp/db_init.sql
  echo "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' identified by '$WP_DB_PASSWORD';" >> /tmp/db_init.sql
  echo "FLUSH PRIVILEGES;" >> /tmp/db_init.sql
  echo "EXIT;" >> /tmp/db_init.sql

  mysqld --user=mysql --console --socket=/var/run/mysqld/mysqld.sock < /tmp/db_init.sql
  rm /tmp/db_init.sql
fi

exec "$@"
