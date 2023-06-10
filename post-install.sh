#!/bin/sh
fzf/install
nvm/install.sh

OS="$(uname)"
echo "$OS detected"
case $OS in
'Linux')
	echo "Linux"
	if [ -f "/etc/debian_version" ]; then
		rm -rf ~/.zplug/
		git clone https://github.com/zplug/zplug ~/.zplug
		sudo apt-get remove -y neovim
		sudo apt-get update

		sudo apt-get install -y \
			zsh \
			neovim \
			python3-neovim \
			fd-find \
			gcc \
			g++
		sudo add-apt-repository ppa:neovim-ppa/unstable
		sudo apt-get -y update
		sudo apt-get install -y neovim
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
