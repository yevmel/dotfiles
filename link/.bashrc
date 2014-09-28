PS1='\[\e[0;33m\]\h\[\e[m\] [\[\e[0;32m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\]] $ '

#
# custom alias
#
case "$(uname -s)" in
"Darwin")
    alias ls="ls -hG"
    alias ll="ls -l"
    alias la="ls -a"
    ;;
"Linux")
    alias ls="ls --color=auto -h"
    alias ll="ls -l"
    alias la="ls -a"
    ;;
esac

#
# custom functions
#
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
            $_GDW_PATH --stacktrace"$@"
            break;
        fi

        _GDW_DIR=$(dirname $_GDW_DIR)
        echo $_GDW_DIR
    done
}

if [ -f ~/.bashrc.custom ]; then
    source ~/.bashrc.custom
fi
