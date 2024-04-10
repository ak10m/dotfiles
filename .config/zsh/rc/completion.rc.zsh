##### completion


### git completion
GIT_COMPLETION_BASH=${ZSH_CACHE_DIR?}/git-completion.bash
if [ ! -e "${GIT_COMPLETION_BASH}" ]; then
  curl -s -o ${GIT_COMPLETION_BASH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

GIT_COMPLETION_ZSH=${ZSH_CACHE_DIR?}/_git
if [ ! -e "${GIT_COMPLETION_ZSH}" ]; then
  curl -s -o ${GIT_COMPLETION_ZSH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi

zstyle ':completion:*:*:git:*' script ${GIT_COMPLETION_BASH}


### docker completion

DOCKER_COMPLETION_ZSH=${ZSH_CACHE_DIR}/_docker
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


