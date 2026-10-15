autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'

setopt PROMPT_SUBST

PROMPT='%F{red}%D{%d.%m.%Y %T}%f [%F{green}%n%f at %F{blue}%m%f] in [%F{cyan}%~%F{yellow}${vcs_info_msg_0_}%f]
→ %f'

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/melnichuk/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions

alias t="tree -L 2"
alias ll="ls -lh"
alias la="ls -a"

# -P   : display port numbers instead of service names
# +c 0 : display the whole name of process
alias lsof="lsof +c 0 -P"

