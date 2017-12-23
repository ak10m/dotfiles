#!/bin/bash

set -e

install_powerline_fonts() {
  local current=$(pwd)
  local repo=$(ghq root)/github.com/powerline/fonts
  if [ ! -d $repo ]; then
    ghq get powerline/fonts
  fi
  cd $repo
  ./install.sh
}

install_powerline_fonts
