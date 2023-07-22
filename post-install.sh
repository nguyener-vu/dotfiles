#!/bin/sh
fzf/install -y
nvm/install.sh -y
echo 'export NVM_DIR=~/.nvm' >~/.bashrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

OS="$(uname)"
echo "$OS detected"
case $OS in
'Linux')
	echo "Linux"
	;;
'FreeBSD')
	echo "FreeBSD"
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
