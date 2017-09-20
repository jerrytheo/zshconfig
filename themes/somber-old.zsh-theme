##
## Somber ZSH Theme - Modification of Bira
## Author: Jerry
##

# Return code
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Username and Hostname
if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%} '
    local user_symbol='%(?:%{$fg_bold[green]%}# :%{$fg_bold[red]%}# )'
elif [[ $SSH_CONNECTION ]]
    local user_host='%{$terminfo[bold]$fg[black]%}%n$fg[red]@%m%{$reset_color%} '
    local user_symbol='%(?:%{$fg_bold[green]%}⇒ :%{$fg_bold[red]%}⇒ )'
else
    local user_host=''
    local user_symbol='%(?:%{$fg_bold[green]%}⇒ :%{$fg_bold[red]%}⇒ )'
fi

# Directory
local current_dir='in %{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}'

# Git settings [(±) master ▾ ●]
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[green]%}(\ue0a0) %{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%} ▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%} ▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%} ●%{$reset_color%}"

local git_branch='$(git_prompt_info)%{$reset_color%}'

# Virtualenv settings {<venv>}.
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[magenta]%}{"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}} "


# Battery
reverse_prompt() {
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

    # Battery temperature
    temp="$( echo $(acpi -t) | awk '{print $4}' )"
    if [[ "$( echo "${temp} < 55.0" | bc )" -eq 1 ]]; then
        tcolor="%{$fg_bold[green]%}"
    elif [[ "$( echo "${temp} < 70.0" | bc )" -eq 1 ]]; then
        tcolor="%{$fg_bold[yellow]%}"
    else
        tcolor="%{$fg_bold[red]%}"
    fi

    temp="[$tcolor$temp °C$reset]"
    echo -n "%B[$percent at %{$fg_bold[black]%}$(date +%R)%{$reset_color%}] $temp%b"
}

# Main prompt
PROMPT="${user_host}${current_dir}${git_branch}
%B${virtualenv_prompt_info}${user_symbol}%b "
RPROMPT='$(reverse_prompt)'
