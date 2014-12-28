#!/bin/bash

alias ll="ls -l"
alias la="ls -a"
alias lsz="unzip -l"

alias rm=moveToTrash

alias grep="grep --color=auto"

PYTHON_VERSION=`python --version 2>&1`
PYTHON_VERSION=${PYTHON_VERSION:7}
if [[ $PYTHON_VERSION =~ ^2. ]]; then
    echo "python 2.x found: $PYTHON_VERSION"
    alias webserver="python -m SimpleHTTPServer 8000"
elif [[ $PYTHON_VERSION =~ ^3. ]]; then
    echo "python 3.x found $PYTHON_VERSION"
    alias webserver="python -m http.server 8000"
fi
