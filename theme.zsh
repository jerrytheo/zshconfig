## Set up different theme custom configurations.
## Supported themes: alien-minimal, minimal, powerlevel9k,
##      spaceship.

case $1 in

    alien-minimal)
        antigen theme eendroroy/alien-minimal alien-minimal
        ;;
    
    minimal)
        MNML_INFOLN=(mnml_err mnml_jobs mnml_files)
        MNML_MAGICENTER=(mnml_me_git)
        antigen theme subnixr/minimal
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
        antigen theme bhilburn/powerlevel9k powerlevel9k
		;;

    spaceship)
        SPACESHIP_PROMPT_ORDER=(
            time        user        host
            dir         git         hg
            package     node        ruby
            elixir      xcode       swift
            golang      php         rust
            haskell     julia       docker
            aws         venv        conda
            pyenv       dotnet      ember
            kubecontext exec_time   line_sep
            vi_mode     jobs        exit_code
            char
        )
        SPACESHIP_CHAR_SUFFIX=" "
        SPACESHIP_PROMPT_ADD_NEWLINE=false
        SPACESHIP_PROMPT_SEPARATE_LINE=false
        SPACESHIP_EXIT_CODE_SHOW=true
        antigen theme denysdovhan/spaceship-prompt spaceship
		;;

    *)
        echo "Unsupported theme."
        ;;
esac