##### completion

ZSH_COMPLETION=${ZDOTDIR}/completion
mkdir -p ${ZSH_COMPLETION}
fpath=(${ZSH_COMPLETION} ${fpath})


### git completion
GIT_COMPLETION_BASH=${ZSH_COMPLETION}/git-completion.bash
if [ ! -e "${GIT_COMPLETION_BASH}" ]; then
  curl -s -o ${GIT_COMPLETION_BASH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

GIT_COMPLETION_ZSH=${ZSH_COMPLETION}/_git
if [ ! -e "${GIT_COMPLETION_ZSH}" ]; then
  curl -s -o ${GIT_COMPLETION_ZSH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi

zstyle ':completion:*:*:git:*' script ${GIT_COMPLETION_BASH}


### docker completion

DOCKER_COMPLETION_ZSH=${ZSH_COMPLETION}/_docker
if [ ! -e "${DOCKER_COMPLETION_ZSH}" ]; then
  curl -s -o ${DOCKER_COMPLETION_ZSH} https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
fi


### configure

autoload -Uz compinit
compinit -i -d ${ZSH_CACHE_DIR:-${ZDOTDIR}}/.zcompdump

autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

setopt complete_in_word

zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' cache-path ${ZSH_CACHE_DIR:-${ZDOTDIR}}/.zcompcache/
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed


# setopt correct
# SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "


##### prompt

GIT_PROMPT_SH=${ZSH_COMPLETION}/git-prompt.sh
if [ ! -e "${GIT_PROMPT_SH}" ]; then
  curl -o ${GIT_PROMPT_SH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

source ${GIT_PROMPT_SH}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{yellow}$(__git_ps1 "(%s)")%f\$ '


