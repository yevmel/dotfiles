#!/bin/bash

sudo apt-get update && sudo apt-get install -y git

#
# setup vim
#
mkdir -p $HOME/.vim/bundle
rm -rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

git clone https://github.com/yevmel/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles && ./install
