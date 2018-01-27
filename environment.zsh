#!/bin/zsh

# Path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin

# Misc
export EDITOR="vim"
export LANG="en_IN.UTF-8"
export ARCHFLAGS="-arch x86_64"     # compilation flags

if [[ $UID -ne 0 ]]; then
    export SSH_KEY_PATH="$HOME/.ssh/rsa_id"     # ssh
    export PROJECT_HOME="$HOME/Code/Projects"   # virtualenvwrapper project dir
fi
