#!/bin/zsh

if [ -z $CODESPACES ]; then
	echo "Is not in CODESPACES"
	chmod +x post-install.sh
	./post-install.sh
else
	echo "Is in CODESPACES"
  zsh -c "curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh"
  apt-get update -y && apt-get upgrade -y
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version

  # Optional: exposing nvim globally.
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi
