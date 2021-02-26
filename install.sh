#!/usr/bin/env bash

_OS=$(uname -r)

grep -q DOTFILES ~/.bashrc
if [ $? -eq 0 ];then
    echo "[!] ~/.bashrc already contains DOTFILES."
else
    echo "[i] setting up DOTFILES"

    echo "export DOTFILES=$PWD" >> ~/.bashrc
    echo "source \$DOTFILES/bashrc" >> ~/.bashrc

    ln -s $PWD/vimrc ~/.vimrc
    ln -s $PWD/gitignore ~/.gitignore
    ln -s $PWD/gitconfig ~/.gitconfig
    ln -s $PWD/editorconfig ~/.editorconfig
    ln -s $PWD/npmrc ~/.npmrc

    mkdir -p $HOME/.config/htop && ln -s $PWD/htoprc ~/.config/htop/htoprc

    if [ $_OS = 'Linux' ]; then
        ln -s $PWD/vscode-settings.json ~/.config/Code/User/settings.json
    elif [ $_OS = 'Darwin' ]; then
        ln -s $PWD/vscode-settings.json ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
        ln -s $PWD/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
    fi

    mkdir -p ~/.gradle && ln -s $PWD/gradle.properties ~/.gradle/
fi
