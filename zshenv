# Aliases
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text'
alias tmux='tmux -u'
alias mux=tmuxinator
alias pyclean='find . -name "*.pyc" -delete'
alias irssi='TERM=screen-256color irssi'
alias profanity='TERM=screen-256color profanity'
alias mutt='TERM=screen-256color mutt -y'
alias ll='ls -l'
alias g='git'
alias news='newsbeuter'
alias rm='echo Use $fg[green]del$reset_color, or the full path $fg[red]/bin/rm$reset_color'
alias vi='echo Use $fg[green]vim$reset_color or $fg[green]nvim'

pytestw () { nodemon -e py -x "py.test $*" }
del () { mv $* ~/.Trash/ }

export DISABLE_AUTO_TITLE="true"
export EDITOR=/usr/local/bin/nvim
export PATH=/usr/local/bin:$PATH:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:$GOPATH/bin
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LESSOPEN='|pygmentize %s'


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/workspace
source /usr/local/bin/virtualenvwrapper.sh

[[ ! -z $VIRTUAL_ENV ]] && export PATH=$VIRTUAL_ENV/bin:$PATH


export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/andreas/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

