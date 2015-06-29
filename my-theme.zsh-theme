# Icons from: https://github.com/ryanoasis/vim-webdevicons
VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{240}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %f"
ZSH_THEME_GIT_PROMPT_DIRTY="%f~"
ZSH_THEME_GIT_PROMPT_CLEAN=""

virtualenv_prompt_info() {
    if [ $VIRTUAL_ENV ]
    then
        echo ' %F{240}'$(echo `basename "$VIRTUAL_ENV"`)
    fi
}

background_jobs_prompt_info() {
    if [ $(jobs | wc -l) -gt 0 ]
    then
        echo '#%F{240}%j %f'
    fi
}

bad_exit_code() {
    if [ $? = 1 ]
    then
        echo '
%F{1}- ! -%f '
    fi
}

RPROMPT='$(background_jobs_prompt_info)$(git_prompt_info)$(virtualenv_prompt_info)'

PROMPT='$(bad_exit_code)
%d
$ '
