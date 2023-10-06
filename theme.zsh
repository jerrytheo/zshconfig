## Set up different theme custom configurations.
## Supported themes: alien-minimal, minimal, powerlevel9k,
##      spaceship.

case $1 in

    alien-minimal)
        zplug eendroroy/alien-minimal
        ;;

    minimal)
        MNML_INFOLN=(mnml_err mnml_jobs mnml_files)
        MNML_MAGICENTER=(mnml_me_git)
        zplug subnixr/minimal
		;;

    powerlevel9k)
        POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
        POWERLEVEL9K_MODE="awesome-fontconfig"
        POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
            vi_mode     root_indicator
            dir         dir_writable
            rbenv       vcs
        )
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
            status      background_jobs
            history     virtualenv
            nodeenv     battery
        )
        zplug bhilburn/powerlevel9k
		;;

    spaceship)
        zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
        SPACESHIP_EXIT_CODE_SHOW=true
        SPACESHIP_AZURE_SYMBOL="󰅟 "
        SPACESHIP_RPROMPT_ORDER=(
            azure
        )
		;;

    *)
        echo "Unsupported theme."
        ;;
esac