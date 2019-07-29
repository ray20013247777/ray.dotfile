
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# gir branch 
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='${debian_chroot:+($debian_chroot)}\[\e[0;36m\]['
if [ `id -u` -eq 0 ]; then
	PS1=$PS1'\[\e[0;31m\]\u'
else
	PS1=$PS1'\[\e[0;36m\]\u'
fi
PS1=$PS1'\[\e[0;36m\]@'
if env | grep -q VIMRUNTIME; then
	PS1=$PS1'\[\e[1;31m\]VIM'
else
	PS1=$PS1'\[\e[1;36m\]\h'
fi
PS1=$PS1'\[\e[0;36m\] \A] '
case "$TERM" in
	screen*) PS1=$PS1'\ek\W\e\\'
		;;
esac
PS1=$PS1'\[\e[1;32m\]\w\[\e[0m\]\[\033[01;33m\]$(parse_git_branch)\[\033[0;37m\] $?\n\$ '

# use vim style
set -o vi
bind -m vi-insert '"\C-p":history-search-backward'
bind -m vi-insert '"\C-n":history-search-forward'
