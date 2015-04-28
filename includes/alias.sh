#!/bin/bash

alias ll="ls -l"
alias la="ls -a"
alias lsz="unzip -l"

alias grep="grep --color=auto"

# -P   : display port numbers instead of service names
# +c 0 : display the whole name of process
alias lsof="lsof +c 0 -P"

PYTHON_VERSION=`python --version 2>&1`
PYTHON_VERSION=${PYTHON_VERSION:7}
if [[ $PYTHON_VERSION =~ ^2. ]]; then
    alias webserver="python -m SimpleHTTPServer 8000"
elif [[ $PYTHON_VERSION =~ ^3. ]]; then
    alias webserver="python -m http.server 8000"
fi
