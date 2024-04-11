#!/bin/zsh

#--------------------------------------------------
# git
#--------------------------------------------------


() {
  mkdir -p ${ZDOTDIR?}/completion

  # https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
  local GIT_PROMPT_SH=${ZDOTDIR?}/completion/git-prompt.sh
  if [ ! -e "${GIT_PROMPT_SH}" ]; then
    curl -o ${GIT_PROMPT_SH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  fi

  source ${GIT_PROMPT_SH}

  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUPSTREAM=auto

  setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{yellow}$(__git_ps1 "(%s)")%f\$ '

  # https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
  local GIT_COMPLETION_ZSH=${ZDOTDIR}/completion/_git
  if [ ! -e "${GIT_COMPLETION_ZSH}" ]; then
    curl -s -o ${GIT_COMPLETION_ZSH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
  fi

  # local GIT_COMPLETION_BASH=${ZDOTDIR}/completion/git-completion.bash
  # if [ ! -e "${GIT_COMPLETION_BASH}" ]; then
  #   curl -s -o ${GIT_COMPLETION_BASH} https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  # fi
  # zstyle ':completion:*:*:git:*' script ${GIT_COMPLETION_BASH}
}
