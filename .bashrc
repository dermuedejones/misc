#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
cowsay -f $(shuf -n 1 -e homercolored).cow $(fortune -s -o)

black="\e[0;30m"
blue="\033[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;33m"
gray="\e[0;37m"
darkgray="\e[1;30m"
lightblue="\e[1;34m"
lightgreen="\e[1;32m"
lightcyan="\e[1;36m"
lightred="\e[1;31m"
lightpurple="\e[1;35m"
yellow="\e[1;33m"
white="\e[1;37m"

usercolor="\[\e[0;33m\]"
rootcolor="\[\e[0;31m\]"

if [ `id -u` -eq "0" ];  then
	root="${rootcolor}"
else
	root="${usercolor}"
fi

alias pacman='pacman-color'
alias ls='ls  --color=tty'
alias grep='grep --color=tyy'

eval $(dircolors -b ~/configs/DIR_COLORS)
#PS1='[\u@\h \W]\$ '
PS1="\[\e[0;37m\]┌─[${root}\u\[\e[0;37m\]][\[\e[0;32m\]\w\[\e[0;37m\]]\n\[\e[0;37m\]└──→\[\e[0m\]"
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
