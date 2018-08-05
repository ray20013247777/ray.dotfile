#!/bin/bash

show_usage() {
	cat << EOF
	Usage: $(basename $0) [options]
	Options:
	-a        install basic apt packages
	-i        install configs
	-v        install vim
	-s        install for synology
	-u        uninstall configs and recover environments
	-h        show this help message
	-d        debug mode
EOF
}

while getopts "ahd" opt; do
	case "$opt" in
		a) InstallApt=yes;;
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

install_apt() {
	exe "apt update"
	exe "apt install -y git"
	exe "apt install -y ssh vim samba"
	exe "apt install -y build-essential ctags cscope"
	exe "apt install -y python-pip python"
	exe "apt install -y python3-pip python3"
	exe "apt install -y silversearcher-ag id-utils"

	exe "pip3 install --upgrade requests"
	exe "pip3 install --upgrade zdict"
}

if [ "$InstallApt" ]; then
	install_apt
fi
