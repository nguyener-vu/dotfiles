#!/bin/sh
fzf/install
nvm/install.sh
echo 'export NVM_DIR=~/.nvm' >~/.bashrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

OS="$(uname)"
echo "$OS detected"
case $OS in
'Linux')
	echo "Linux"
	if [ -f "/etc/debian_version" ]; then
		echo "export NVM_DIR='$HOME/.nvm'
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion" >~/.bashrc

		source ~/.bashrc
		nvm install --lts
		export ZPLUG_HOME=~/.zplug
		rm -rf $ZPLUG_HOME
		git clone https://github.com/zplug/zplug $ZPLUG_HOME

		sudo apt-get remove -y neovim

		sudo apt-get install -y \
			zsh \
			vim \
			python3-neovim \
			python3 \
			python3-pip \
			fd-find \
			gcc \
			ripgrep \
			vim-gtk3 \
			g++ \
			luajit \
			lua5.3 \
			tmux
		pip3 install pynvim
		pip3 install --upgrade pynvim
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
		chmod u+x nvim.appimage
		./nvim.appimage --appimage-extract
		./squashfs-root/AppRun --version

		# Optional: exposing nvim globally.
		sudo mv squashfs-root /
		sudo rm -rf /usr/bin/nvim
		sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
		./nvim.appimage --appimage-extract
		LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
		curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
		tar xf lazygit.tar.gz lazygit
		sudo install lazygit /usr/local/bin
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
