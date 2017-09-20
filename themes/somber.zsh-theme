##
## Somber ZSH Theme - Modification of Bira
## Author: Jerry
##

# Git settings [(±) master ▾ ●]
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[green]%}(\ue0a0) %{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✘%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED=" +"
ZSH_THEME_GIT_PROMPT_MODIFIED=" !"
ZSH_THEME_GIT_PROMPT_RENAMED=" »"
ZSH_THEME_GIT_PROMPT_DELETED=" ✕"
ZSH_THEME_GIT_PROMPT_STASHED=" $"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ="
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⇕"

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%} ▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%} ▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%} ●%{$reset_color%}"

# Virtualenv settings {<venv>}.
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[magenta]%}{"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}} "


# User & Hostname
somber_user() {
    local user
    if [[ $UID -eq 0 ]]; then
        user='%{$terminfo[bold]$fg[red]%}%n '
    elif [[ $SSH_CONNECTION ]]; then
        user='%{$terminfo[bold]$fg[green]%}%n'
    else
        user=''
    fi
    echo -n $user
}

somber_host() {
    local host
    if [[ $SSH_CONNECTION ]]; then
        host='%{$terminfo[bold]$fg[black]%}@%m%{$reset_color%} '
    else
        host=''
    fi
    echo -n $host
}

somber_dir() {
    local current_dir
    current_dir='in %{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}'
    echo -n $current_dir
}

somber_git() {
    local git_branch
    git_branch='$(git_prompt_info)%{$reset_color%}'
    echo -n $git_branch
}

somber_battery_date() {
    local battery_info

    data=$(acpi -b 2>/dev/null)
    reset="%{$reset_color%}"

    # Return if no battery
    [[ -z $data ]] && return

    # Battery percentage
    if [[ $(echo $data | grep "Full") ]]; then
        percent="%{$fg_bold[green]%}A.C.$reset"
    else
        percent="$( echo $data | awk '{print $4}' | tr -d ,% )"
        if [[ $percent -gt 60 ]]; then
            pcolor="%{$fg_bold[green]%}"
        elif [[ $percent -gt 20 ]]; then
            pcolor="%{$fg_bold[yellow]%}"
        else
            pcolor="%{$fg_bold[red]%}"
        fi

        # Battery charge status
        stat="$( echo $data | awk '{print tolower($3)}' | cut -d, -f1 )"
        if [[ $stat == "charging" ]]; then
            pcolor="%{$fg_bold[green]%}"
            charge="⇡"
        else
            charge="⇣"
        fi
        percent="$pcolor$percent$charge%%$reset"
    fi

    battery_info="%B[$percent at %{$fg_bold[black]%}$(date +%R)%{$reset%}]%b"
    echo -n $battery_info
}

somber_temperature() {
    local temperature

    data=$(acpi -t 2>/dev/null)
    reset="%{$reset_color%}"

    # Return if no battery
    [[ -z $data ]] && return

    # Battery temperature
    temp="$( echo ${data} | awk '{print $4}' )"
    if [[ "$( echo "${temp} < 55.0" | bc )" -eq 1 ]]; then
        tcolor="%{$fg_bold[green]%}"
    elif [[ "$( echo "${temp} < 70.0" | bc )" -eq 1 ]]; then
        tcolor="%{$fg_bold[yellow]%}"
    else
        tcolor="%{$fg_bold[red]%}"
    fi

    temperature="%B[$tcolor$temp °C$reset]%b"
    echo -n " $temperature"
}

somber_prompt_sym() {
    local user_symbol
    if [[ $UID -eq 0 ]]; then
        user_symbol='%(?:%{$fg_bold[green]%}# :%{$fg_bold[red]%}# )%{$reset_color%}'
    else
        user_symbol='%(?:%{$fg_bold[green]%}⇒ :%{$fg_bold[red]%}⇒ )%{$reset_color%}'
    fi
    echo -n $user_symbol
}

forward_prompt() {
    local prompt user_host
    user_host="$(somber_user)$(somber_host)"
    prompt="${user_host}$(somber_dir)$(somber_git)"
    if [[ -n $user_host ]]; then
        prompt="$( echo $prompt )"
        prompt="${prompt}${virtualenv_prompt_info} $(somber_prompt_sym) "
    fi
    prompt="${virtualenv_prompt_info}${prompt} $(somber_prompt_sym) "
    echo -n $prompt
}

reverse_prompt() {
    echo -n "$(somber_battery_date)$(somber_temperature)"
}

PROMPT="$(forward_prompt)"
RPROMPT="$(reverse_prompt)"
