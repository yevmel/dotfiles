#!/usr/bin/env bash

source setup-install.sh

link_file() {
	FROM=$1
	TO=$2

	echo "[i] creating link from $FROM to $TO"

    if [ -a $TO ] &&  [ ! -h $TO ]; then
        $SLINK_WITH_BAK $FROM $TO
    else
        $SLINK $FROM $TO
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

for f in {vimrc,gitignore,gitconfig,bash_profile}; do
    link_file $PWD/home/$f $HOME_DIR/.$f
done

for f in {bashrc,}; do
    append_source $PWD/home/$f $HOME_DIR/.$f
done
