#!/usr/bin/env bash

source ./setenv.$(uname -s).sh

for f in $(ls -A ./link); do
    LINK_FILE $PWD/link/$f $HOME/$f
done
