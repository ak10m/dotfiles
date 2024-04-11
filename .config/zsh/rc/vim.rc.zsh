#!/bin/zsh

#--------------------------------------------------
# vim
#--------------------------------------------------

() {
  alias vim="nvim"
  export EDITOR=vim
  export VIMINIT=":source ${XDG_CONFIG_HOME}"/nvim/init.vim
}
