# rbenv
if [ -a ~/.rbenv/version ]; then
    PATH="$HOME/.rbenv/versions/$(cat ~/.rbenv/version)/bin:$PATH"
fi

# pyenv
if [ -a ~/.pyenv/version ]; then
    PATH="$HOME/.pyenv/versions/$(cat ~/.pyenv/version)/bin:$PATH"
fi

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh