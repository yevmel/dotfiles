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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/melnichuk/.lmstudio/bin"
# End of LM Studio CLI section

