FROM alpine:3.16

LABEL description="REDIS from alpine project Inception 42"
LABEL maintener="By LeoMoreno <lmoreno@student.42quebec.com>"
LABEL version="1.0"

RUN apk --update add --no-cache redis
#	&& echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf \
#	&& sysctl vm.overcommit_memory=1 -- error Read-only file system

# config
COPY ./conf/redis.conf /etc/redis.conf

ENTRYPOINT ["redis-server", "/etc/redis.conf", "--protected-mode no"]
