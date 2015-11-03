# Aliases
alias tmux='tmux -u'
alias pyclean='find . -name "*.pyc" -delete'
alias mutt='mutt -y'
alias ll='ls -l'
alias g='git'
alias news='newsbeuter'
alias rm='echo Use $fg[green]del$reset_color, or the full path $fg[red]/bin/rm$reset_color'
alias vi='/usr/local/bin/nvim'
alias testdb='mycli -u root -P 3307 -D getanewsletter -R "\t \u@gantest:\d> "'
alias db='mycli -u root -D getanewsletter'

fsw () {
    filetype="$1";
    shift;
    find -L . -type f -name "*.$filetype" | entr -c -r "$@"
}

nvimex_tags() {
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  )
  ~/dotfiles/nvimex.py e $(cut -f3 <<< "$line")
  ~/dotfiles/nvimex.py "silent tag $(cut -f2 <<< "$line")"
}

del () { mv $* ~/.Trash/ }

export DISABLE_AUTO_TITLE="true"
export EDITOR=/usr/local/bin/nvim
export PATH=/usr/local/bin:$PATH:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:
export TERM=screen-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LESSOPEN='|pygmentize %s'
export FZF_DEFAULT_COMMAND='ag -f -l -U --nocolor'
export FZF_TMUX=0
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/workspace
export PATH=$PATH:/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/bin
source virtualenvwrapper.sh

source ~/.secrets.zsh


# Setup gopath
export GOPATH=$HOME/.gopath
export PATH=$PATH:$GOPATH/bin

alias gowhich='readlink ~/.gopath'

gostart () {
    mkdir src pkg bin
    goactivate
}
goactivate () {
    godeactivate
    ln -s $(pwd) $GOPATH
    echo "Activated `gowhich`"
}

godeactivate () {
    if [ -h "$GOPATH" ]
    then
        /bin/rm $GOPATH
    fi
}

# Opens the github page for the current git repository in your browser
# Takes an optional argument which is the file to view.
github () {
    giturl=$(git config --get remote.origin.url)

    if [ -z "$giturl" ]
    then
        echo "Not a git repository or no remote.origin.url set"
        exit 1;
    fi

    giturl=${giturl/git\@github\.com\:/https://github.com/}
    giturl=${giturl/\.git/\/tree/}

    branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
        branch="(unnamed branch)"
    branch=${branch##refs/heads/}

    giturl=$giturl$branch/$1
    open $giturl
}

[[ ! -z $NVIM_LISTEN_ADDRESS ]] && alias nvimex='~/dotfiles/nvimex.py'
[[ ! -z $VIRTUAL_ENV ]] && export PATH=$VIRTUAL_ENV/bin:$PATH

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/andreas/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
