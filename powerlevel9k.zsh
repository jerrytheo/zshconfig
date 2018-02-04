#!/bin/zsh

POWERLEVEL9K_MODE="awesome-fontconfig"

# Left elements.
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    vi_mode
    root_indicator
    dir
    dir_writable
    rbenv
    vcs
)

# Right elements.
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    background_jobs
    history
    virtualenv
    nodeenv
    battery
)