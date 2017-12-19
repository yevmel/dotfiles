#!/bin/bash

if [ $_OS = 'Linux' ]; then
    alias ls="ls --color=auto -h"
elif [ $_OS = 'Darwin' ]; then
    alias ls="ls -hG"
else
    echo "[!] unknow OS $_OS"
fi

alias ll="ls -lh"
alias la="ls -a"

# -P   : display port numbers instead of service names
# +c 0 : display the whole name of process
alias lsof="lsof +c 0 -P"

alias prettyjson='python -m json.tool'

# requires:
# - pygments python module
alias jsonx='pygmentize -l json'
alias xmlx='pygmentize -l xml'

alias mkdirsrc='mkdir -p src/{test,main}/{java,resources}'