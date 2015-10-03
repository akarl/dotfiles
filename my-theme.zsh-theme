# Icons from: https://github.com/ryanoasis/vim-webdevicons
VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="~"
ZSH_THEME_GIT_PROMPT_CLEAN=""

virtualenv_prompt_info() {
    if [ $VIRTUAL_ENV ]
    then
        echo ' '$(echo `basename "$VIRTUAL_ENV"`)
    fi
}

gopath_prompt_info() {
    if [ -h "$GOPATH" ]
    then
        echo ' '$(gowhich)
    fi

}

background_jobs_prompt_info() {
    if [ $(jobs | wc -l) -gt 0 ]
    then
        echo '#%F{240}%j %f'
    fi
}

precmd() {
    echo -n '\033]2;''/'$(echo `basename "$PWD"`)'/''\033\\'
}

preexec() {
    echo -n '\033]2;''/'$(echo `basename "$PWD"`)'/ '$(echo "$1")'\033\\'
}

RPROMPT='⏎ $(echo $?) $(background_jobs_prompt_info)$(git_prompt_info)$(gopath_prompt_info)$(virtualenv_prompt_info)%f'

PROMPT='
%d
$ %f'
