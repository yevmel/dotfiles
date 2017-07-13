#!/usr/bin/env bash

grep -q DOTFILES ~/.bashrc
if [ $? -eq 0 ];then
    echo "[!] ~/.bashrc already contains DOTFILES."
else
    echo "[i] setting up DOTFILES"

    echo "export DOTFILES=$PWD" >> ~/.bashrc
    echo "source \$DOTFILES/bashrc" >> ~/.bashrc

    ln -s $DOTFILES/vimrc ~/.vimrc
    ln -s $DOTFILES/gitignore ~/.gitignore
    ln -s $DOTFILES/gitconfig ~/.gitconfig
    ln -s $DOTFILES/editorconfig ~/.editorconfig

    mkdir -p ~/.gradle && ln -s $DOTFILES/gradle.properties ~/.gradle/
fi
