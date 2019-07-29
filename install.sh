#!/bin/bash

show_usage() {
	cat << EOF
	Usage: $(basename $0) [options]
	Options:
	-a        install basic apt packages
	-i        install configs & bin
	-v        install vim
	-s        install for synology
	-u        uninstall configs and recover environments
	-h        show this help message
	-d        debug mode
EOF
}

while getopts "ahdi" opt; do
	case "$opt" in
		a) InstallApt=yes;;
		i) InstallConfig=yes;;
		h) show_usage; exit 0;;
		d) DEBUG=on;;
	esac
done


exe() {
	echo "$1"
	if [ -z "$DEBUG" ]; then
		eval "$1"
	fi
}

install_git() {
	ln -s $PWD/git/.gitconfig ~/
}

install_tmux() {
	ln -s $PWD/tmux/.tmux.conf ~/
}

install_vim() {
	ln -s $PWD/vim/.vimrc ~/
}

install_apt() {
	exe "apt update"
	exe "apt install -y git"
	exe "apt install -y ssh vim samba"
	exe "apt install -y build-essential ctags cscope"
	exe "apt install -y python-pip python"
	exe "apt install -y python3-pip python3"
	exe "apt install -y silversearcher-ag id-utils"
	exe "apt install tmux"

	exe "pip3 install --upgrade requests"
	exe "pip3 install --upgrade zdict"
}

install_config() {
	
	install_git
	install_tmux
	install_vim

}

if [ "$InstallApt" ]; then
	install_apt
fi

if [ $InstallConfig ]; then
	echo "starting install config..."
	install_config
	echo "finish"
fi

