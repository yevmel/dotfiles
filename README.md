dotfiles
--------------

a set of individual config files.

install Vundle
--------------

    mkdir -p ~/.vim/bundle
    rm -rf $HOME/.vim/bundle/Vundle.vim
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

setup dotfiles
--------------

    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dotfiles config status.showUntrackedFiles no
    cd && dotfiles checkout -f

