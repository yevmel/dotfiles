#!/usr/bin/env bash

link() {
	FROM=$1
	TO=$2

    if [ -a $TO ] &&  [ ! -h $TO ]; then
        ln -sb -S .bak $FROM $TO
    else
	    ln -sf $FROM $TO
    fi
}

append_source() {
    ADDITIONAL_SCRIPT=$1
    TARGET=$2

    if [ -a $TARGET ]; then
        echo "source $ADDITIONAL_SCRIPT" >> $TARGET
    else
        link $ADDITIONAL_SCRIPT $TARGET
    fi
}

SCRIPT_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

for f in {vimrc,gitignore,gitconfig}; do
    link $SCRIPT_DIR/home/$f ~/.$f
done

for f in {bashrc,}; do
    append_source $SCRIPT_DIR/home/$f ~/.$f
done
