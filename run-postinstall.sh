#!/bin/zsh

if [ -z $CODESPACES ]; then
	echo "Is not in CODESPACES"
	chmod +x post-install.sh
	./post-install.sh
else
	echo "Is in CODESPACES"
  export ZPLUG_HOME=~/.zplug
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  apt-get update -y && apt-get upgrade -y
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version

  # Optional: exposing nvim globally.
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi
