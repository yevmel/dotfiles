#!/usr/bin/env bash

LINK_FILE() {
    FROM=$1
    TO=$2

    echo "creating link from $FROM to $TO"
    ln -sb -S .bak $FROM $TO
}

source ./setenv.sh
