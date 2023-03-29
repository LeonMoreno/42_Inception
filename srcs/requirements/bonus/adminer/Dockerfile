FROM alpine:3.15

LABEL description="adminer from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache php7 php7-fpm php7-phar php7-json php7-mysqli \
	mariadb-client php-iconv php7-phar curl \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

# php fpm
COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

# install wp and start
COPY ./conf/docker-entrypoint.sh /tmp/

ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]

# CMD [ "php-fpm7", "-F"]
