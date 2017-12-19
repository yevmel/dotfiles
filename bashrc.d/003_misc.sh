#/bin/bash

PYTHON_VERSION=`python --version 2>&1`
PYTHON_VERSION=${PYTHON_VERSION:7}
if [[ $PYTHON_VERSION =~ ^2. ]]; then
    alias webserver="python -m SimpleHTTPServer 8000"
elif [[ $PYTHON_VERSION =~ ^3. ]]; then
    alias webserver="python -m http.server 8000"
fi

# rbenv
if [ -a ~/.rbenv/version ]; then
    PATH="$HOME/.rbenv/versions/$(cat ~/.rbenv/version)/bin:$PATH"
fi

# pyenv
if [ -a ~/.pyenv/version ]; then
    PATH="$HOME/.pyenv/shims:$PATH"
fi

#nvm
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    . "$NVM_DIR/nvm.sh"
fi

