#!/bin/sh
fzf/install

OS="$(uname)"
echo "$OS detected"
case $OS in
'Linux')
	echo "Linux"
	curl -L https://nixos.org/nix/install | sh -s -- --daemon
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
	sudo rm -rf /nix/
	sudo rm /etc/bash.bashrc.*
	(curl -L https://nixos.org/nix/install) | sh
	;;
'SunOS')
	echo "SunOS"
	;;
'AIX') ;;
*) ;;
esac

cd fonts && sh install.sh