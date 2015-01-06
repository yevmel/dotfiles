#!/usr/bin/env bash

source ./setenv.sh

for f in $(ls -A ./link); do
    LINK_FILE $PWD/link/$f $HOME/$f
done

mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "export DOTFILES=$(pwd)" >> ~/.bashrc.custom
