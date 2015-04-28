#!/bin/bash

printFileFromZip() {
    _FILE=$1
    _ZIP=$2

    unzip -q -c $_ZIP $_FILE
}

printManifestFromZip() {
    _ZIP=$1

    printFileFromZip "META-INF/MANIFEST.MF" $_ZIP
}

# traverse the directory hierarchy up until finds a gradlew file and executes
# it with arguments supplied by user
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

# created a preconfigured eclipse workspace
# work in progress :)
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

initAnsibleRoles() {
    for role in "$@"; do
        mkdir -p "$role"/{defaults,tasks,templates}
    done
}

iAR() {
    initAnsibleRoles "$@"
}
