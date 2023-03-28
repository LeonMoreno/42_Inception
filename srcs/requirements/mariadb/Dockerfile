FROM alpine:3.15

LABEL description="maria_db project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache mariadb mariadb-client

RUN if [ ! -d "/var/lib/mysql/mysql" ]; then \
echo "hola mi leo" \
mysql_install_db --user=mysql --datadir=/var/lib/mysql --rpm --skip-test-db \
fi
# RUN mysql_install_db --user=root --datadir=/var/lib/mysql --rpm --skip-test-db > /dev/null

# Para el sock -- i know whatis the sock.
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

#COPY mariadb.conf /etc/mysql/
COPY init.sql /docker-entrypoint-initdb.d/
COPY run.sh /root/

ENTRYPOINT [ "/root/run.sh" ]

CMD ["mysqld", "--user=mysql", "--console", "--socket=/var/run/mysqld/mysqld.sock"]

