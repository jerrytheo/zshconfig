#!/bin/zsh

##
## Jerry's zsh config file.
## Requires: oh-my-zsh
## 

# Initial setup
# =============

ZSH_CUSTOM=$HOME/.zsh
for file in $ZSH_CUSTOM/*.zsh; do
	source $file
done
HIST_STAMPS="dd.mm.yyyy"


# Plugins
# =======

# oh-my-zsh plugins {{{
antigen use oh-my-zsh

antigen bundle battery             # convenient functions for prompt.
antigen bundle colored-man-pages   # as it says.
antigen bundle colorize            # colorized cat.
antigen bundle cp                  # cp with progress (rsync)
antigen bundle vi-mode             # some stuff.

# Plugins for non-root users.
if [[ $UID -ne 0  ]]; then
	antigen bundle autojump 			# faster directory traversing.
	antigen bundle autopep8 			# completion for the pep8 tool.
    antigen bundle command-not-found   	# suggest new command.
	antigen bundle debian 				# aliases for apt.
    antigen bundle extract             	# swiss army knife (or so they say).
    antigen bundle git                 	# way too many to bother.
	antigen bundle jsontools 			# display/validate JSON.
	antigen bundle npm 					# completion for npm.
    antigen bundle pip                 	# clean cache, list clean pkgs.
    antigen bundle python              	# pyfind, pyclean, pygrep.
	antigen bundle sudo 				# put sudo in front of command.
    antigen bundle web-search          	# search online.
fi
# }}}
# the other plugins {{{
antigen bundle chrissicool/zsh-256color 		# 256 colors on terminal.
antigen bundle hlissner/zsh-autopair 			# easier delimiter handling.
antigen bundle djui/alias-tips 					# specifies if alias defined.
antigen bundle zsh-users/zsh-syntax-highlighting 	# syntax coloring
antigen theme geometry-zsh/geometry 			# A cool theme.
# }}}
antigen apply


# Install Settings
# ================

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
