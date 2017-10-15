##!/bin/zsh

# Aliases
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vi='gvim'
alias clrz='colorize'
alias py='python'

if [[ $UID -ne 0 ]]; then
    alias svim='sudo vim'
    alias ipy='ipython'
    alias pipi='pip intall --user'
fi
