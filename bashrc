#!/usr/bin/env bash

_OS=$(uname -s)

for i in $DOTFILES/bashrc.d/*; do
    echo "[i] source $i"
    source $i
done
