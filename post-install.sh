#!/bin/sh
fzf/install
nvm/install.sh

OS="$(uname)"
echo "$OS detected"
case $OS in
'Linux')
	echo "Linux"
	if [ -f "/etc/debian_version" ]; then
		export ZPLUG_HOME=~/.zplug
		rm -rf $ZPPLUG_HOME
		git clone https://github.com/zplug/zplug $ZPLUG_HOME
		sudo apt-get remove -y neovim
		sudo apt-get update

		sudo apt-get install -y \
			zsh \
			vim \
			python3-neovim \
			fd-find \
			gcc \
			g++
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		chmod u+x nvim.appimage
		./nvim.appimage --appimage-extract
		./squashfs-root/AppRun --version

		# Optional: exposing nvim globally.
		sudo mv squashfs-root /
		sudo rm -rf /usr/bin/nvim
		sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
		./nvim.appimage --appimage-extract
		#  nvim
		# ./nvim.appimage
	fi
	;;
'FreeBSD')
	echo "FreeBSD"
	curl -L https://nixos.org/nix/install | sh -s -- --daemon
	;;
'WindowsNT')
	echo "Windows"
	;;
'Darwin')
	echo "Is Mac"
	;;
'SunOS')
	echo "SunOS"
	;;
'AIX') ;;
*) ;;
esac

cd fonts && sh install.sh
