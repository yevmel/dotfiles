#!/usr/bin/env bash

_OS=$(uname -s)

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

    # visual studio code
    if [ $_OS = 'Linux' ]; then
        mkdir -p ~/.config/Code/User
        ln -s $PWD/vscode-settings.json ~/.config/Code/User/settings.json
    elif [ $_OS = 'Darwin' ]; then
        ln -s $PWD/vscode-settings.json ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
        ln -s $PWD/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
    fi

    # konsole
    if [ $_OS = 'Linux' ]; then
        mkdir -p ~/.local/share/konsole
        ln -s $PWD/melnichuk.profile ~/.local/share/konsole/
    fi
fi
