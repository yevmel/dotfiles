#!/usr/bin/env bash

export _OS=$(uname -s)

for i in $DOTFILES/bashrc.d/*; do
    echo "[i] source $i"
    source $i
done
