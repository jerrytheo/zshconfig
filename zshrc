
## The zshrc.
## Entry point to my configuration.
## Symlink this file to $HOME/.zsh.

# Initial setup
# =============

# Themes this will configure:
#  alien-minimal, minimal, spaceship, powerlevel9k
ZSH_EXTTHEME="spaceship"
ZSH_CUSTOM=$HOME/.zsh
ZSH_SCRIPTS=(
  'aliases.zsh'         # common aliases to use.
  'completion.zsh'      # autocomplete settings.
  'environment.zsh'     # environment variables.
  'keybindings.zsh'     # helpful keybindings.
)
for _script in $ZSH_SCRIPTS; do
  source $ZSH_CUSTOM/$_script
done

# Check if a system specific file exists and source it.
# The commands in this file are not saved in to remote.
[[ -e $ZSH_CUSTOM/specific.zsh ]] && source $ZSH_CUSTOM/specific.zsh

# Pre-plugins
HIST_STAMPS="dd.mm.yyyy"
fpath=($fpath "$HOME/.zfunctions")

# Setup zplug
# ZPLUG_DIR=$HOME/.zplug/init.zsh
# if [[ ! -a $ZPLUG_DIR ]]; then
#   ZPLUG_DIR=/usr/share/zplug/init.zsh
# fi
ZPLUG_DIR=/opt/homebrew/Cellar/zplug/2.4.2/init.zsh
source $ZPLUG_DIR

# Plugins
# =======

PLUGS_OHMYZSH_ROOT=(
  'colored-man-pages'                 # as it says.
  'cp'                                # cp with progress (rsync)
  'vi-mode'                           # some stuff.
)
[[ $UID -ne 0  ]] && PLUGS_OHMYZSH_USER=(
  'ag'                                # the silver searcher
  'alias-searcher'                    # tips to find aliases faster
  # 'autojump'                          # faster directory traversing
  'autopep8'                          # completion for the pep8 tool
  # 'bgnotify'                          # bg notifications for long commands
  'brew'                              # brew aliases
  'command-not-found'                 # suggest new command
  'colorize'                          # colorize cat output
  'common-aliases'                    # common aliases
  'copyfile'                          # copy this file
  'copypath'                          # copy current or specified absolute path
  'debian'                            # aliases for apt
  'extract'                           # swiss army knife (or so they say)
  'git'                               # way too many to bother.
  'gulp'
  'jsontools'                         # display/validate JSON.
  'macos'
  'node'
  'npm'                               # completion for npm.
  'pip'                               # clean cache, list clean pkgs.
  'python'                            # pyfind, pyclean, pygrep.
  'sudo'                              # put sudo in front of command.
  'yarn'
)
for _plug in ${PLUGS_OHMYZSH_ROOT} ${PLUGS_OHMYZSH_USER}; do
  zplug plugins/$_plug, from:oh-my-zsh
done

PLUGS_GITHUB=(
  'hlissner/zsh-autopair'             # easier delimiter handling.
  'zsh-users/zsh-syntax-highlighting' # syntax coloring
  'zsh-users/zsh-autosuggestions'     # autosuggest
)
for _plug in ${PLUGS_GITHUB}; do
  zplug $_plug
done

source $ZSH_CUSTOM/theme.zsh $ZSH_EXTTHEME
zplug check || zplug install
zplug load

# Post-plugin setup
# =================

ZSH_ALIAS_FINDER_AUTOMATIC=true       # auto find aliases

# Do some additional setup for spaceship post install.
if [[ $ZSH_EXTTHEME -eq "spaceship" ]]; then
  spaceship remove azure
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

source ~/.torusrc
