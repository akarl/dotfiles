NCOLOR="245"

VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='
%K{$NCOLOR}%F{232} %d %K{234}%F{$NCOLOR}%F{$NCOLOR}$(git_prompt_info)%k%F{234} %F{$NCOLOR}$(echo `basename "$VIRTUAL_ENV"`)
%K{234}%F{$NCOLOR} # %k%F{234} %f'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" ⎁"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

