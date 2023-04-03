#! /bin/sh
# init hugo
if [ ! -d /var/www/site ]; then
  echo "[INFO] Hugo Start up."
  hugo new site myportafolio
  cd myportafolio
  git init
  # git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
  # git submodule add https://github.com/jacksalici/salinger-theme.git themes/salinger
  # git submodule add https://github.com/Yukuro/hugo-theme-shell.git themes/hugo-theme-shell
  # git submodule add https://github.com/LordMathis/hugo-theme-nix themes/hugo-theme-nix
  git submodule add https://github.com/rhazdon/hugo-theme-hello-friend-ng.git themes/hello-friend-ng
  echo "theme = 'hello-friend-ng'" >> config.toml
fi


# exec 
hugo server --bind=0.0.0.0

