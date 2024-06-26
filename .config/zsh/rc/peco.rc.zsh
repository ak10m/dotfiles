#!/bin/zsh

#--------------------------------------------------
# peco
#--------------------------------------------------

() {
  local PECO_HISTORY_ZSH=${ZDOTDIR}/functions/zsh-peco-history.zsh
  if [ ! -e "${PECO_HISTORY_ZSH}" ]; then
    curl -s -o ${PECO_HISTORY_ZSH} https://raw.githubusercontent.com/jimeh/zsh-peco-history/master/zsh-peco-history.zsh
  fi
  source ${PECO_HISTORY_ZSH}

  local PECO_GHQ_REPOSITORY_ZSH=${ZDOTDIR}/functions/zsh-peco-ghq-repository.zsh
  source ${PECO_GHQ_REPOSITORY_ZSH}
}
