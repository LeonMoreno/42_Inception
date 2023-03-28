FROM alpine:3.15

LABEL description="NGINX project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache nginx 

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

RUN echo ${NET} > /root/hola

EXPOSE 80/tcp

# https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting
# To run in foreground: daemon off;
# To run in background: nginx or daemon on
#CMD ["nginx", "-g", "daemon on;"]
CMD ["nginx", "-g", "daemon off;"]
