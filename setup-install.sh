#!/usr/bin/env bash

# consider differences between gnu and bsd impls of ln
function setup_ln() {
	SLINK="ln -sf"

	if [ "Darwin" == $(uname -s) ]; then
		SLINK_WITH_BAK=$SLINK
	else
		SLINK_WITH_BAK="ln -sb -S .bak"
	fi
}

# change to something else to test the scripts before you let it loose
HOME_DIR="$HOME"

setup_ln
