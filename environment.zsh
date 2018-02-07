## Sets up a bunch of environment variables for convenience.

## I prefer installing python and node global packages to $HOME/.local/bin
## instead of globally for all users. I also prefer .bin over bin as it stays
## out of my way during regular use.

# Path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin

# Misc
export EDITOR="vim"
export LANG="en_IN.UTF-8"                       # Indian locale. Change this to suit you.
export ARCHFLAGS="-arch x86_64"                 # compilation flags

if [[ $UID -ne 0 ]]; then
    export SSH_KEY_PATH="$HOME/.ssh/rsa_id"     # ssh
fi