##
## Jerry's zsh config file.
## Requires: oh-my-zsh
## 

# Path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin

# Path to oh-my-zsh
export ZSH=/home/jerry/.oh-my-zsh

# Some settings
ZSH_THEME="somber"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM=$HOME/.zsh

# Plugins
plugins=(
    archlinux           # pacman, pacaur aliases; pacdisowned, paclist
    battery             # convenient functions for prompt.
    colored-man-pages   # as it says.
    colorize            # colorized cat.
    command-not-found   # suggest new command.
    cp                  # cp with progress (rsync)
    extract             # swiss army knife (or so they say).
    git                 # way too many to bother.
    kate                # kate, kt.
    pip                 # clean cache, list clean pkgs.
    python              # pyfind, pyclean, pygrep.
    vi-mode             # some stuff.
    virtualenv          # virtualenv on prompt.
    virtualenvwrapper   # workon_cwd
    web-search          # search online.
)

source $ZSH/oh-my-zsh.sh

# =====

# My settings

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# My configs
source $HOME/.zsh/aliases.zsh       # aliases
source $HOME/.zsh/environment.zsh   # environment vars
source $HOME/.zsh/completion.zsh    # compsys settings
source $HOME/.zsh/key-bindings.zsh  # key bindings

