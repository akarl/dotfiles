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
alias pip='python -m pip'
alias fsw='ag -l . | entr -c -r'  # using ag here for nice .gitignore etc.

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

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/workspace
export PATH=$PATH:/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/bin
source virtualenvwrapper.sh


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

[[ ! -z $VIRTUAL_ENV ]] && export PATH=$VIRTUAL_ENV/bin:$PATH

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/andreas/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
