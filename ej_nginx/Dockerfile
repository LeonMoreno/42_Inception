#
# NOTE: THIS DOCKERFILE IS GEN BY LEO
#

FROM alpine:3.15

# How to nginx on alpine
#https://wiki.alpinelinux.org/wiki/Nginx

RUN apk --update add nginx \
    && apk add php7-fpm \
    && mkdir /var/www/html

COPY ./default.conf /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

