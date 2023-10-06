## Set up a bunch of convenient aliases.

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vi='vim'
alias gv='gvim'
alias catc='colorize'
alias cls='clear'

# Aliases for non root users.
if [[ $UID -ne 0 ]]; then
    alias svim='sudo vim'
    alias virc='gvim ~/.vimrc'
fi
