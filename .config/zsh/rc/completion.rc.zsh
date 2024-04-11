#!/bin/zsh

#--------------------------------------------------
# completion
#--------------------------------------------------

() {
  fpath=(~/.zsh/completion $fpath)

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
}
