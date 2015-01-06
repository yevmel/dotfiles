#!/usr/bin/env bash

LINK_FILE() {
    _FROM=$1
    _TO=$2

    if [ -f $_TO ]; then
        mv $_TO $_TO.bak
    fi

    echo "creating link from $_FROM to $_TO"
    ln -sf $_FROM $_TO
}

COPY_FILE() {
    _FROM=$1
    _TO=$2

    if [ -f $_TO ]; then
        mv $_TO $_TO.bak
    fi

    echo "copying $_FROM to $_TO"
    cp -r $_FROM $_TO
}
