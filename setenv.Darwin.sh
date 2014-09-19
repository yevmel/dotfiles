#!/usr/bin/env bash

LINK_FILE() {
    FROM=$1
    TO=$2

    if [ -f $TO ]; then
        mv $TO $TO.bak
    fi

    echo "creating link from $FROM to $TO"
    ln -sf $FROM $TO
}

source ./setenv.sh
