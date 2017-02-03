#!/bin/bash

# traverse the directory hierarchy up until finds a gradlew file and executes
# it with arguments supplied by user
gdw() {
    _GDW_DIR=$(pwd)
    while [ "$_GDW_DIR" != "/" ]; do
        if [ -f "$_GDW_DIR/gradlew" ]; then
            _GDW_EXEC="$_GDW_DIR/gradlew --stacktrace"

            if [ -f $_GDW_DIR/init.gradle ]; then
                _GDW_EXEC="$_GDW_EXEC -I $_GDW_DIR/init.gradle"
            fi

            $_GDW_EXEC "$@"
            break;
        fi

        _GDW_DIR=$(dirname $_GDW_DIR)
        echo $_GDW_DIR
    done
}

