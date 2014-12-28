#!/bin/bash

if [ -f ~/.bashrc.custom ]; then
    source ~/.bashrc.custom
fi

_OS=$(uname -s)

source $DOTFILES/includes/colors.sh
source $DOTFILES/includes/git-prompt.sh

# contains things like rbenv, pyenv and nvm.
# should be sourced first in case python, ruby or node are used in other files
source $DOTFILES/includes/misc.$_OS.sh

source $DOTFILES/includes/functions.$_OS.sh
source $DOTFILES/includes/alias.$_OS.sh

PS1="${Yellow}\\h ${White}[${Green}\\u ${Blue}\\w${White}]\$(__git_ps1 ' ⎇ %s') ${Color_Off}\$ "
