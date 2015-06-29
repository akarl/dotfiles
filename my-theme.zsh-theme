# Icons from: https://github.com/ryanoasis/vim-webdevicons
VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="~"
ZSH_THEME_GIT_PROMPT_CLEAN=""

MODE_INDICATOR='%F{240}[NORMAL]'

virtualenv_prompt_info() {
    if [ $VIRTUAL_ENV ]
    then
        echo ' '$(echo `basename "$VIRTUAL_ENV"`)
    fi
}

PROMPT='
%d %F{240}$(git_prompt_info)$(virtualenv_prompt_info)
%(1j.%j.)%f$ '

