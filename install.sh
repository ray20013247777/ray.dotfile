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

while getopts "h" opt; do
	case $opt in
		h) show_usage; exit 0;;
	esac
done
