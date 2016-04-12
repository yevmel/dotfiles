#!/bin/bash

if [ -f ~/.bashrc.custom ]; then
    source ~/.bashrc.custom
fi

_OS=$(uname -s)

HISTSIZE=1000
HISTFILESIZE=2000

source $HOME/.colors.sh
source $HOME/.git-prompt.sh
source $HOME/.bashrc.alias
source $HOME/.bashrc.misc

PS1="\n${Yellow}\\h \D{%T} ${White}[${Green}\\u ${Blue}\\w${White}]\$(__git_ps1 ' ⎇ %s') \n⇨ ${Color_Off}"

