##
## Somber ZSH Theme - Modification of Bira
## Author: Jerry
##

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
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset} "

#ZSH_THEME_GIT_PROMPT_CLEAN=" (${grn}✓ ${reset})"
#ZSH_THEME_GIT_PROMPT_DIRTY="${red}✘${reset}"

ZSH_THEME_GIT_PROMPT_ADDED="${blu}+${reset}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${ylw_bold}!${reset}"
ZSH_THEME_GIT_PROMPT_RENAMED="${mgt_bold}»${reset}"
ZSH_THEME_GIT_PROMPT_DELETED="${red_bold}✕${reset}"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_UNMERGED="="
ZSH_THEME_GIT_PROMPT_DIVERGED="${red_bold}⇕${reset}"

ZSH_THEME_GIT_PROMPT_AHEAD="${cyn}▴${reset}"
ZSH_THEME_GIT_PROMPT_BEHIND="${mgt}▾${reset}"
ZSH_THEME_GIT_PROMPT_STAGED="${grn}●${reset}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="${ylw}●${reset}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${red}●${reset}"

# Virtualenv settings {<venv>}.
ZSH_THEME_VIRTUALENV_PREFIX="${mgt_bold}<<"
ZSH_THEME_VIRTUALENV_SUFFIX=">>${reset} "


# User & Hostname
somber_user() {
    local user
    if [[ $UID -eq 0 ]]; then
        user="${red_bold}%n "
    elif [[ $SSH_CONNECTION ]]; then
        user="${grn_bold}%n"
    else
        user=""
    fi
    echo -n $user
}

somber_host() {
    local host
    if [[ $SSH_CONNECTION ]]; then
        host="${blk_bold}@%m${reset} "
    else
        host=""
    fi
    echo -n $host
}

somber_dir() {
    local current_dir
    current_dir="in ${ylw_bold}{${$(basename $PWD)/$USER/~}}${reset}"
    echo -n $current_dir
}

somber_git() {
    local git_branch git_status
    [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]] || return

    git_branch="$(git_prompt_info)"

    git_status="$(git_prompt_status)"
    git_prompt="[ ${git_branch}${wht_bold}${git_status:-${grn_bold}✓${wht_bold}} ${reset}] "
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
        percent="${grn}A.C.${reset}"
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
        percent="${pcolor}${percent}${charge}%%${reset}"
    fi

    battery_info="${percent}"
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
    temp=$(echo $temp | python -c "print(round(float(input())), end='')")
    temperature="${tcolor}${temp}°${reset}"
    echo -n $temperature
}

somber_prompt_sym() {
    local user_symbol
    if [[ $UID -eq 0 ]]; then
        user_symbol="%(?:${grn_bold}# :${red}# )${reset}"
    else
        user_symbol="%(?:${grn_bold}➜ :${red}➜ )${reset}"
    fi
    echo -n $user_symbol
}

forward_prompt() {
    local prompt
    prompt='[$(somber_battery)] $(somber_user)$(somber_host)$(somber_dir) $(somber_prompt_sym) $(virtualenv_prompt_info)'
    echo -n $prompt
}

reverse_prompt() {
    echo -n '$(somber_git)[$(somber_temperature)]'
}

PROMPT="$(forward_prompt)"
RPROMPT="$(reverse_prompt)"
