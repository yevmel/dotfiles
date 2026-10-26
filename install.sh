#!/usr/bin/env bash

_OS=$(uname -s)

# appends a line to a file, unless the file already contains it
append_once() {
    touch "$1"
    grep -qxF "$2" "$1" || echo "$2" >> "$1"
}

# links source to target, unless the link exists already; never replaces other files
link() {
    if [ "$(readlink "$2")" = "$1" ]; then
        return
    elif [ -e "$2" ] || [ -L "$2" ]; then
        echo "[!] $2 exists already, skipping"
    else
        ln -s "$1" "$2"
    fi
}

echo "[i] setting up DOTFILES"

append_once ~/.bashrc "export DOTFILES=$PWD"
append_once ~/.bashrc "source \$DOTFILES/bashrc"

append_once ~/.zshrc "export DOTFILES=$PWD"
append_once ~/.zshrc "source \$DOTFILES/zshrc"

link $PWD/vimrc ~/.vimrc
link $PWD/gitignore ~/.gitignore
link $PWD/gitconfig ~/.gitconfig
link $PWD/editorconfig ~/.editorconfig
link $PWD/npmrc ~/.npmrc

# mkdir -p $HOME/.config/htop && ln -s $PWD/htoprc ~/.config/htop/htoprc

