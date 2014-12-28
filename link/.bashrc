#!/bin/bash

if [ -f ~/.bashrc.custom ]; then
    source ~/.bashrc.custom
fi

_OS=$(uname -s)

source $DOTFILES/includes/colors.sh
source $DOTFILES/includes/functions.$_OS.sh
source $DOTFILES/includes/alias.$_OS.sh
source $DOTFILES/includes/misc.$_OS.sh

PS1="${Yellow}\\h ${White}[${Green}\\u ${Blue}\\w${White}] ${Color_Off}\$ "
