#!/bin/sh

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
	(curl -L https://nixos.org/nix/install) | sh
	;;
'SunOS')
	echo "SunOS"
	;;
'AIX') ;;
*) ;;
esac
