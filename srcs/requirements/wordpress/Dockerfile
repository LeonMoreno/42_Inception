FROM alpine:3.15

LABEL description="php_ and wordpress from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache php7-fpm php7-mysqli \
	mariadb-client

COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD [ "php-fpm7", "-F"]
