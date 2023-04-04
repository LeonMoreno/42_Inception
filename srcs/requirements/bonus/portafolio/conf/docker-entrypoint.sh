#! /bin/sh
# init hugo
if [ ! -d /var/www/site ]; then
  echo "[INFO] Hugo Start up."
  hugo new site myportafolio
  cd myportafolio
  git init
  git submodule add https://github.com/Yukuro/hugo-theme-shell.git themes/hugo-theme-shell
  #echo "theme = 'hugo-theme-shell'" >> config.toml
  cp  /tmp/config.toml .
fi


# exec 
hugo server --bind=0.0.0.0

