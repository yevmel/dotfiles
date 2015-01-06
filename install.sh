#!/usr/bin/env bash

source ./setenv.sh

for f in $(ls -A ./link); do
    LINK_FILE $PWD/link/$f $HOME/$f
done

for f in $(ls -A ./copy); do
    COPY_FILE $PWD/copy/$f $HOME/$f
done

echo "export DOTFILES=$(pwd)" >> ~/.bashrc.custom
