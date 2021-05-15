#!/usr/bin/env bash

_OS=$(uname -s)

for i in $DOTFILES/bashrc.d/*; do
    # echo in .bashrc sometimes causes problems with git over ssh
    # echo "[i] source $i"
    source $i
done
