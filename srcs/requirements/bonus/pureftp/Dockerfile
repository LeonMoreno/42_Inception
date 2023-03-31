#https://www.baeldung.com/linux/docker-alpine-add-user
# how to user Alpine dockerfile

FROM alpine:3.16

LABEL description="PURE-FTDP from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache pure-ftpd \
	&& adduser -H -D -h /home/leo leo \
	&& echo leo:Col2020 | chpasswd

# config

EXPOSE 21

CMD [ "pure-ftpd"]
