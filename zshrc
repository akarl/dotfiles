autoload -U compinit
compinit

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

export SAVEHIST=10000
export HISTFILE="$HOME/.zsh-history"

# Fish style syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "`pip completion --zsh`"

# Source the prompt
source $HOME/dotfiles/prompt.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export KEYTIMEOUT=1

bindkey "^[[3~" delete-char
bindkey '^w' backward-kill-word
bindkey '^p' up-history
bindkey '^n' down-history

bindkey -v
