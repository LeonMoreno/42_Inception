FROM alpine:3.15

LABEL description="php_ and wordpress from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL wp-cli="Use of https://wp-cli.org/"
LABEL version="1.0"

RUN apk --update add --no-cache php7 php7-fpm php7-phar php7-json php7-mysqli \
	mariadb-client curl \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD [ "php-fpm7", "-F"]
