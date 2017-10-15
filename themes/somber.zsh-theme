# vim: set filetype=zsh

## Somber ZSH Theme - Modification of Bira
## Author: Jerry

# Colors
blk="%{$fg[black]%}"
red="%{$fg[red]%}"
grn="%{$fg[green]%}"
ylw="%{$fg[yellow]%}"
blu="%{$fg[blue]%}"
mgt="%{$fg[magenta]%}"
cyn="%{$fg[cyan]%}"
wht="%{$fg[white]%}"

blk_bold="%{$fg_bold[black]%}"
red_bold="%{$fg_bold[red]%}"
grn_bold="%{$fg_bold[green]%}"
ylw_bold="%{$fg_bold[yellow]%}"
blu_bold="%{$fg_bold[blue]%}"
mgt_bold="%{$fg_bold[magenta]%}"
cyn_bold="%{$fg_bold[cyan]%}"
wht_bold="%{$fg_bold[white]%}"

reset="%{$reset_color%}"

# Git settings [(±) master ▾ ●]
ZSH_THEME_GIT_PROMPT_PREFIX="${grn_bold}\ue0a0 ${wht}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset}"

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${red}*${reset}"

ZSH_THEME_GIT_PROMPT_ADDED="${blu} ✚${reset}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${ylw_bold} ✹${reset}"
ZSH_THEME_GIT_PROMPT_RENAMED="${ylw} ➦${reset}"
ZSH_THEME_GIT_PROMPT_DELETED="${red_bold} ✖${reset}"
ZSH_THEME_GIT_PROMPT_STASHED=" ☰"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ⇉"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${red_bold} ↕${reset}"

ZSH_THEME_GIT_PROMPT_AHEAD="${cyn} ⬆${reset}"
ZSH_THEME_GIT_PROMPT_BEHIND="${mgt} ⬇${reset}"
ZSH_THEME_GIT_PROMPT_STAGED="${grn} ●${reset}"
#ZSH_THEME_GIT_PROMPT_UNSTAGED="${ylw} ●${reset}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${red} ✭${reset}"

# Virtualenv settings {<venv>}.
ZSH_THEME_VIRTUALENV_PREFIX="${mgt_bold}<<"
ZSH_THEME_VIRTUALENV_SUFFIX=">>${reset} "


# User & Hostname
somber_user() {
    local user
    if [[ $UID -eq 0 ]]; then
        user=" ${red_bold}%n${reset}"
    elif [[ $SSH_CONNECTION ]]; then
        user=" ${blu_bold}%n${reset}"
    else
        user=""
    fi
    echo -n $user
}

somber_host() {
    local host
    if [[ $SSH_CONNECTION ]]; then
        host="${blk_bold}(@%m)${reset} "
    else
        host=" "
    fi
    echo -n $host
}

somber_dir() {
    local current_dir
    current_dir="${ylw}{${wht_bold}in ${reset}${ylw}${$(basename $PWD)/$USER/~}}${reset}"
    echo -n $current_dir
}

somber_git() {
    local git_branch git_status
    [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]] || return

    git_branch="$(git_prompt_info)"

    git_status="$(git_prompt_status)"
    git_prompt="[ ${git_branch}${wht_bold}${git_status} ${reset}] "
    echo -n $git_prompt
}

somber_battery() {
    local battery_info

    data=$(acpi -b 2>/dev/null)
    reset="${reset}"

    # Return if no battery
    [[ -z $data ]] && return

    # Battery percentage
    if [[ $(echo $data | grep "Full") ]]; then
        pcolor=${grn}
        percent=" "
    else
        percent=$(echo $data | awk '{print $4}' | tr -d ,%)
        if [[ $percent -gt 60 ]]; then
            pcolor="${grn}"
        elif [[ $percent -gt 20 ]]; then
            pcolor="${ylw}"
        else
            pcolor="${red}"
        fi

        # Battery charge status
        stat=$(echo $data | awk '{print tolower($3)}' | cut -d, -f1)
        if [[ $stat == "charging" ]]; then
            pcolor="${grn}"
            charge='⇡'
        else
            charge='⇣'
        fi
        percent="${percent}${charge}%%"
    fi

    battery_info="${pcolor}[${wht_bold}on ${pcolor}${percent}]${reset}"
    echo -n $battery_info
}

somber_temperature() {
    local temperature

    data=$(acpi -t 2>/dev/null)
    reset="${reset}"

    # Return if no battery
    [[ -z $data ]] && return

    # Battery temperature
    temp=$( echo ${data} | awk '{print $4}' )
    if [[ $( echo "${temp} < 55.0" | bc ) -eq 1 ]]; then
        tcolor="${grn}"
    elif [[ $( echo "${temp} < 70.0" | bc ) -eq 1 ]]; then
        tcolor="${ylw}"
    else
        tcolor="${red}"
    fi
    temp=$(echo $temp | cut -d. -f1)
    temperature="${tcolor}${temp}°${reset}"
    echo -n $temperature
}

somber_prompt_sym() {
    local user_symbol
    if [[ $UID -eq 0 ]]; then
        user_symbol="%(?:${cyn}# :${red}# )${reset}"
    else
        user_symbol="%(?:${cyn} :${red} )${reset}"
    fi
    echo -n $user_symbol
}

forward_prompt() {
    local prompt
    prompt='$(somber_battery)$(somber_user)$(somber_host)$(somber_dir) $(somber_prompt_sym) $(virtualenv_prompt_info)'
    echo -n $prompt
}

reverse_prompt() {
    echo -n '$(somber_git)[$(somber_temperature)]'
}

PROMPT="$(forward_prompt)"
RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(reverse_prompt)"

function zle-line-init zle-keymap-select {
    VIM_PROMPT="${red_bold}[cmd]${reset}"
    PROMPT="$(forward_prompt)"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(reverse_prompt)"
    zle reset-prompt
}
