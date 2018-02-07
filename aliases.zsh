## Set up a bunch of convenient aliases.

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vi='vim'
alias gv='gvim'
alias catc='colorize'

# Set py to python3 on systems with python 2 as default.
pyv=`python --version 2>&1`
if [[ -n $(echo $pyv | grep -E "Python 2\.[0-9]+\.[0-9]+")  ]]; then
    alias py='python3'
    alias pipi='pip3 install --user'
else
    alias py='python'
    alias pipi='pip install --user'
fi

# Aliases for non root users.
if [[ $UID -ne 0 ]]; then
    alias svim='sudo vim'
    alias virc='gvim ~/.vimrc'
fi