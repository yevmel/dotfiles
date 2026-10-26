autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'

setopt PROMPT_SUBST
PROMPT='%F{red}%D{%d.%m.%Y %T}%f [%F{green}%n%f at %F{blue}%m%f] in [%F{cyan}%~%F{yellow}${vcs_info_msg_0_}%f]
→ %f'
