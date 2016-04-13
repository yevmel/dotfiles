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

PS1="\n${IRed}\\D{%T}${Color_Off} [\\u@\\h] in [${Blue}\\w${Yellow}\$(__git_ps1 ' ⎇ %s')${Color_Off}] \n⇨ ${Color_Off}"
