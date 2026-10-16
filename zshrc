autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'

autoload -Uz compinit && compinit
zstyle ':completion:*' special-dirs true

setopt PROMPT_SUBST
PROMPT='%F{red}%D{%d.%m.%Y %T}%f [%F{green}%n%f at %F{blue}%m%f] in [%F{cyan}%~%F{yellow}${vcs_info_msg_0_}%f]
→ %f'

export CLICOLOR=1

alias t="tree -L 2"
alias ll="ls -lh"
alias la="ls -a"

# -P   : display port numbers instead of service names
# +c 0 : display the whole name of process
alias lsof="lsof +c 0 -P"

