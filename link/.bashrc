PS1='\[\e[0;33m\]\h\[\e[m\] [\[\e[0;32m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\]] $ '

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
