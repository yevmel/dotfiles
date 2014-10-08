#!/bin/bash

moveToTrash() {
    _FROM=$1
    _TO=~/.Trash/$(basename $_FROM)

    if [ -a $_TO ]; then
        _TO="$_TO $(date +"%T")"
    fi

    mv "$_FROM" "$_TO"
}

printFileFromZip() {
    _FILE=$1
    _ZIP=$2

    unzip -q -c $_ZIP $_FILE
}

printManifestFromZip() {
    _ZIP=$1

    printFileFromZip "META-INF/MANIFEST.MF" $_ZIP
}

gdw() {
    _GDW_DIR=$(pwd)

    while [ "$_GDW_DIR" != "/" ]; do
        _GDW_PATH="$_GDW_DIR/gradlew"
        if [ -f $_GDW_PATH ]; then
            $_GDW_PATH --stacktrace "$@"
            break;
        fi

        _GDW_DIR=$(dirname $_GDW_DIR)
        echo $_GDW_DIR
    done
}

initEclipseWorkspace() {
    _DIR=$1

    if [ -z "$_DIR" ]; then
        _DIR=$(pwd)
    fi

    mkdir -p $_DIR
    cp -r $DOTFILES/eclipse-workspace/. $_DIR/
}

iEW() {
    initEclipseWorkspace $@
}

