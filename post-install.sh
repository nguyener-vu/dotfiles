#!/bin/sh
fzf/install --all
nvm/install.sh
echo 'export NVM_DIR=~/.nvm' >~/.bashrc
TPM_FOLDER=~/.tmux/plugins/tpm
CURR=$PWD
if [ ! -d $LOCALREPO_VC_DIR ]; then
	git clone https://github.com/tmux-plugins/tpm $TPM_FOLDER
else
	echo "Already exists"
fi

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
	./fonts/install.sh
	;;
'SunOS')
	echo "SunOS"
	;;
'AIX') ;;
*) ;;
esac

