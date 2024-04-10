##### prompt

GIT_PROMPT_SH=${ZSH_CACHE_DIR?}/git-prompt.sh
if [ ! -e "${GIT_PROMPT_SH}" ]; then
  curl -o ${GIT_PROMPT_SH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

source ${GIT_PROMPT_SH}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{yellow}$(__git_ps1 "(%s)")%f\$ '
