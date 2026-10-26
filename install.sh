#!/usr/bin/env bash

_OS=$(uname -s)

echo "[i] setting up DOTFILES"

echo "export DOTFILES=$PWD" >> ~/.bashrc
echo "source \$DOTFILES/bashrc" >> ~/.bashrc

echo "export DOTFILES=$PWD" >> ~/.zshrc
echo "source \$DOTFILES/zshrc" >> ~/.zshrc

ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gitignore ~/.gitignore
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/editorconfig ~/.editorconfig
ln -s $PWD/npmrc ~/.npmrc

# mkdir -p $HOME/.config/htop && ln -s $PWD/htoprc ~/.config/htop/htoprc

