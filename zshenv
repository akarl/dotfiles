alias tmux='tmux -u'
alias pyclean='find . -name "*.pyc" -delete'
alias ll='ls -l'
alias g='git'
alias vi='/usr/local/bin/nvim'
alias less='/usr/bin/less -X'
alias r='/usr/local/bin/ranger'
alias py='ipython'
# alias python='python2'
# alias pip='pip2'

export DISABLE_AUTO_TITLE="true"
export EDITOR=/usr/local/bin/nvim
export PATH=/usr/local/bin:$PATH:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LESSOPEN='|pygmentize %s'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --color never --glob "!.git/*"' 
export FZF_TMUX=0
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

source ~/.secrets.zsh

export GOPATH=$HOME/workspace/gocode
export PATH=$PATH:$GOPATH/bin

# Add local scripts to path
export PATH=$HOME/dotfiles/bin:$PATH

function dev() {
	pushd ~/workspace/chef
	vagrant $@
	popd
}

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
	source "${VIRTUAL_ENV}/bin/activate"
fi
