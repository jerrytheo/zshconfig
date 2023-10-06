## Sets up a bunch of environment variables for convenience.

## I prefer installing python and node global packages to $HOME/.local/bin
## instead of globally for all users. I also prefer .bin over bin as it stays
## out of my way during regular use.

# Path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin

# Misc
export EDITOR="vim"
export ARCHFLAGS=-`uname -m`                 # compilation flags

if [[ $UID -ne 0 ]]; then
    export SSH_KEY_PATH="$HOME/.ssh/rsa_id"     # ssh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"