#!/bin/bash

set -e

function install_fisher() {
  local script=~/.config/fish/functions/fisher.fish
  if [ ! -e $script ]; then
    cprint "[install][curl]" 35
    echo " fisher"
    curl -Lo $script --create-dirs git.io/fisher
  fi
}

install_fisher
