#!/bin/bash

set -e

install_fonts() {
  local current=$(pwd)
  git clone https://github.com/powerline/fonts /tmp/powerline-fonts
  cd /tmp/powerline-fonts
  ./install.sh
  cd $current
}

if [ ! -d /tmp/powerline-fonts ]; then
  install_fonts
fi
