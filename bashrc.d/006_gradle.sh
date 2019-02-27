#!/bin/bash

# traverse the directory hierarchy up until finds a gradlew file and executes
# it with arguments supplied by user
_GDW_DIR="$(pwd)"

function gdw() {
while [ "$_GDW_DIR" != "/" ]; do
    echo "[i] looking for gradlew in $_GDW_DIR"

    if [ -f "$_GDW_DIR/gradlew" ]; then
        echo "[i] found gradlew in $_GDW_DIR"

        _GDW_EXEC="$_GDW_DIR/gradlew"
        _GDW_OPTS="--stacktrace"

        if [ -f "$_GDW_DIR/init.gradle" ]; then
            _GDW_OPTS="$_GDW_OPTS -I $_GDW_DIR/init.gradle"
        fi

        "$_GDW_EXEC" $_GDW_OPTS "$@"
        break
    fi

    _GDW_DIR=$(dirname "$_GDW_DIR")
done
}

