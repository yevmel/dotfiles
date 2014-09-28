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

if [ -f ~/.bashrc.custom ]; then
    source ~/.bashrc.custom
fi
