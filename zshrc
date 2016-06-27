autoload -U compinit
compinit

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE="$HOME/.zsh-history"
export KEYTIMEOUT=1

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/prompt.zsh

eval "`pip completion --zsh`"

bindkey "^[[3~" delete-char
bindkey '^w' backward-kill-word
bindkey '^p' up-history
bindkey '^n' down-history
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
