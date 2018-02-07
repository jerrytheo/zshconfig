## The zshrc.
## Entry point to my configuration.
## Symlink this file to $HOME/.zsh.


# Initial setup
# =============

# Themes this will configure:
#	alien-minimal, minimal, spaceship, powerlevel9k
ZSH_EXTTHEME="minimal"
ZSH_CUSTOM=$HOME/.zsh
ZSH_SCRIPTS=(
	'aliases.zsh'			# common aliases to use.
	'antigen.zsh'			# the antigen file.
	'completion.zsh'		# autocomplete settings.
	'environment.zsh'		# environment variables.
	'key-bindings.zsh'		# helpful keybindings.
)
for _script in $ZSH_SCRIPTS; do
	source $ZSH_CUSTOM/$_script
done

# Check if a system specific file exists and source it.
# The commands in this file are not saved in to remote.
[[ -e $ZSH_CUSTOM/specific.zsh ]] && source $ZSH_CUSTOM/specific.zsh

# Pre-plugins
ANTIGEN_CACHE=$HOME/.antigen/init-${ZSH_EXTTHEME}.zsh
HIST_STAMPS="dd.mm.yyyy"
fpath=($fpath "$HOME/.zfunctions")
autoload -U promptinit; promptinit


# Plugins
# =======

# oh-my-zsh plugins {{{
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
	battery             # convenient functions for prompt.
	colored-man-pages   # as it says.
	colorize            # colorized cat.
	cp                  # cp with progress (rsync)
	vi-mode             # some stuff.
EOBUNDLES

# Plugins for non-root users.
[[ $UID -ne 0  ]] && antigen bundles <<EOBUNDLES
		autojump 			# faster directory traversing.
		autopep8 			# completion for the pep8 tool.
    	command-not-found   # suggest new command.
		debian 				# aliases for apt.
    	extract             # swiss army knife (or so they say).
    	git                 # way too many to bother.
		jsontools 			# display/validate JSON.
		npm 				# completion for npm.
    	pip                 # clean cache, list clean pkgs.
    	python              # pyfind, pyclean, pygrep.
		sudo 				# put sudo in front of command.
    	web-search          # search online.
EOBUNDLES
# }}}
# the other plugins {{{
antigen bundles <<EOBUNDLES
	chrissicool/zsh-256color 			# 256 colors on terminal.
	hlissner/zsh-autopair 				# easier delimiter handling.
	djui/alias-tips 					# specifies if alias defined.
	zsh-users/zsh-syntax-highlighting 	# syntax coloring
	zsh-users/zsh-autosuggestions		# autosuggest
EOBUNDLES

source $ZSH_CUSTOM/theme.zsh $ZSH_EXTTHEME
antigen apply


# Post-plugin setup
# =================

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install


# vim:foldmethod=marker