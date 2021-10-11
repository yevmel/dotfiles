#!/usr/bin/env bash

PS1="\n${IRed}\\D{%T}${Color_Off} [${Green}\\u${Color_Off} at ${IBlue}\\h ($WSL_DISTRO_NAME)${Color_Off}] in [${Cyan}\\w${Yellow}\$(__git_ps1 ' %s')${Color_Off}] \n→ ${Color_Off}"
