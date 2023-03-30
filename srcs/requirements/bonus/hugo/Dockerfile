FROM    alpine:3.15


RUN     apk --update add --no-cache \
            hugo git

# create new hugo site
WORKDIR /var/www/

RUN hugo new site static \
 	&&     cd static \
 	&&     git clone https://github.com/vaga/hugo-theme-m10c themes/m10c
# 	&&     hugo -b https://vbachele.42.fr/me

COPY    ./conf/config.toml        /var/www/static/config.toml

EXPOSE 1313

#CMD     ["hugo", "server", \
#         "--bind=0.0.0.0", \
#         "-p", "1313", \
#         "--logFile=/dev/stdout", \
#        "--appendPort=false"]
CMD ["hugo", "server", "--bind=0.0.0.0"]
