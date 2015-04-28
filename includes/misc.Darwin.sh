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
NVM_PATH="$(brew --prefix nvm)/nvm.sh"
if [ -a $NVM_PATH ]; then
    source "$NVM_PATH"
fi

nvm use stable
