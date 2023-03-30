FROM alpine:3.15

LABEL description="vsftpd from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache vsftpd

# config
COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

# install adminer and start
COPY ./conf/docker-entrypoint.sh /tmp/

ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]

# CMD [ "php-fpm7", "-F"]
