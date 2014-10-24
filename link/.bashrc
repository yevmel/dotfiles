#!/bin/bash

if [ -f ~/.bashrc.custom ]; then
    source ~/.bashrc.custom
fi

PS1='\[\e[0;33m\]\h\[\e[m\] [\[\e[0;32m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\]] $ '
_OS=$(uname -s)

source $DOTFILES/includes/functions.$_OS.sh
source $DOTFILES/includes/alias.$_OS.sh
source $DOTFILES/includes/misc.$_OS.sh
