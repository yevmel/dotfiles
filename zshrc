_OS=$(uname -s)

for i in $DOTFILES/common.d/* $DOTFILES/zsh.d/*; do
    source $i
done
