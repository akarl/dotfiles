alias tmux='tmux -u'
alias pyclean='find . -name "*.pyc" -delete'
alias ll='ls -l'
alias g='git'
alias vi='/usr/local/bin/nvim'
alias dev='VAGRANT_CWD=~/workspace/chef vagrant'
alias less='/usr/bin/less -X'
alias r='/usr/local/bin/ranger'

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
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/workspace

source ~/.secrets.zsh
source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=$HOME/workspace/gocode
export PATH=$PATH:$GOPATH/bin

# Add local scripts to path
export PATH=$PATH:$HOME/dotfiles/bin

[[ ! -z $VIRTUAL_ENV ]] && export PATH=$VIRTUAL_ENV/bin:$PATH
