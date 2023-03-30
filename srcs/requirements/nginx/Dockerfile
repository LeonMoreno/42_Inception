FROM alpine:3.15

LABEL description="NGINX project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache nginx \
	&& mkdir -p /var/www/static

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./cert/certi.crt /etc/ssl/certs/certi.crt
COPY ./cert/keyssl.key /etc/ssl/private/keyssl.key
COPY ./site/pagina.html /var/www/static

EXPOSE 443/tcp

# https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting
# To run in foreground: daemon off;
# To run in background: nginx or daemon on
#CMD ["nginx", "-g", "daemon on;"]
CMD ["nginx", "-g", "daemon off;"]
