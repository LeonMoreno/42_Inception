FROM alpine:3.15

LABEL description="adminer from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache php7 php7-fpm php7-phar php7-json php7-mysqli \
		php-iconv php7-phar wget php7-zip php7-tokenizer php7-xmlwriter php7-simplexml php7-dom \
		php7-mbstring php7-gettext php7-session php7-xml php7-curl

EXPOSE 9000

# php fpm
COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

# install adminer and start
COPY ./conf/docker-entrypoint.sh /tmp/

ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]

# CMD [ "php-fpm7", "-F"]
