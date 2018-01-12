#!/bin/zsh

##
## Jerry's zsh config file.
## Requires: oh-my-zsh
## 

# Path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin

# Android Studio
export PATH=$PATH:$HOME/Software/android-studio/bin
export PATH=$PATH:$HOME/Android/Sdk/tools/bin
export PATH=$PATH:$HOME/Android/Sdk/platform-tools


# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Some settings
ZSH_THEME="somber"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM=$HOME/.zsh

# Plugins
plugins=(
    battery             # convenient functions for prompt.
    colored-man-pages   # as it says.
    colorize            # colorized cat.
    cp                  # cp with progress (rsync)
    vi-mode             # some stuff.
    web-search          # search online.
)

plugins_non_root=(
    archlinux           # pacman, pacaur aliases; pacdisowned, paclist
    command-not-found   # suggest new command.
    extract             # swiss army knife (or so they say).
    git                 # way too many to bother.
    kate                # kate, kt.
    pip                 # clean cache, list clean pkgs.
    python              # pyfind, pyclean, pygrep.
    virtualenv          # virtualenv on prompt.
#    virtualenvwrapper   # workon_cwd
)

[[ $UID -ne 0 ]] && plugins=($plugins[@] $plugins_non_root[@])
source $ZSH/oh-my-zsh.sh

# =====

# My settings

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

