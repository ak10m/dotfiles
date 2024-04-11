#!/bin/zsh

#--------------------------------------------------
# Alias
#--------------------------------------------------

() {
  if type dircolors >/dev/null
  then # GNU ls
    alias _ls-color='command ls --color=auto'
  else # BSD ls
    alias _ls-color='command ls -G'
  fi

  alias ls='_ls-color -F' la='ls -a' ll='ls -Ahl'
  alias cp='cp -pi'
  alias mv='mv -i'
  alias df='df -h'
  alias du='du -h'
  alias su='su -l'
  alias grep='grep --color=auto'
  alias diff='diff -U 0'
}
