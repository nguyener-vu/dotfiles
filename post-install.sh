#!/bin/zsh

fzf/install --all
nvm/install.sh
echo "Install node and source nvm"
source ~/.zshrc
NVM_DEFAULT_VERSION=18.6.0

nvm install $NVM_DEFAULT_VERSION
nvm alias default $NVM_DEFAULT_VERSION
enableCorepackPnpm # from zsh_functions, setup corepack install of pnpm

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
