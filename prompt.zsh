# Icons from: https://github.com/ryanoasis/vim-webdevicons

autoload -U colors
colors

setopt PROMPTSUBST

# Import the git prompt.
source ~/.share/git-prompt.sh

function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_STATESEPARATOR=''

# Disable the normal virtualenv prompt.
VIRTUAL_ENV_DISABLE_PROMPT=1

git_prompt_info() {
    git_info=$(__git_ps1)

    if [ $git_info ]
    then
        echo " $git_info |"
    fi
}

virtualenv_prompt_info() {
    if [ $VIRTUAL_ENV ]
    then
        base=$(echo `basename "$VIRTUAL_ENV"`)
        echo " $base |"
    fi
}

gopath_prompt_info() {
    if [ -h "$GOPATH" ]
    then
        echo " $(gowhich) |"
    fi
}

background_jobs_prompt_info() {
    if [ $(jobs | wc -l) -gt 0 ]
    then
        echo "#%F{240}%j%f |"
    fi
}

vi_normal_prompt_info() {
    echo "${${KEYMAP/vicmd/[NORMAL]}/(main|viins)/}"
}

precmd() {
    echo -n '\033]2;''/'$(echo `basename "$PWD"`)'/''\033\\'
}

preexec() {
    echo -n '\033]2;''/'$(echo `basename "$PWD"`)'/ '$(echo "$1")'\033\\'
}


RPROMPT='$(vi_normal_prompt_info) ⏎ $(echo $?) $(background_jobs_prompt_info) $(git_prompt_info) $(virtualenv_prompt_info)%f'

PROMPT='
%d
$ %f'
