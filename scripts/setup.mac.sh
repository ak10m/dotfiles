#!/bin/bash

set -e

##### variables
ROOT=$(cd $(dirname ${0})/../; pwd)

##### functions
source $ROOT/scripts/functions.sh

##### setup

#--------------------------------------------------
# XCode
#--------------------------------------------------
source $ROOT/scripts/install/xcode.mac.sh


#--------------------------------------------------
# brew - https://github.com/Homebrew/brew
#--------------------------------------------------
require brew mac

# Utilities
require curl brew
require tree brew
require tig brew
require ghq brew
require peco brew
require hub brew
require tmux brew


#--------------------------------------------------
# direnv - https://github.com/direnv/direnv
#--------------------------------------------------
require direnv brew
eval "$(direnv hook bash)"


#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------
export ASDF_DIR=$HOME/.asdf
if [ ! -d $ASDF_DIR ]; then
  require asdf noarch
  source $ASDF_DIR/asdf.sh
  source $ASDF_DIR/completions/asdf.bash

  # Plugins
  dependency gpg brew # nodejs
  source $ROOT/scripts/install/asdf-plugins.noarch.sh
fi


#--------------------------------------------------
# neovim - https://github.com/neovim/neovim
#--------------------------------------------------
dependency python3 brew
# for vim-go
require golang brew
require mercurial brew

require nvim brew

if [ ! -e ~/.config/nvim ]; then
  mkdir -p ~/.config
  cecho "[link] $ROOT/.config/vim ~/.config/nvim" 35
  ln -s $ROOT/.config/vim ~/.config/nvim
fi


#--------------------------------------------------
# fish - https://github.com/fish-shell/fish-shell
#--------------------------------------------------
require fish brew

if [ ! -e ~/.config/fish ]; then
  cecho "[link] $ROOT/.config/fish ~/.config/fish" 35
  mkdir -p ~/.config
  ln -s $ROOT/.config/fish ~/.config/fish
fi

source $ROOT/scripts/install/fisher.curl.sh
source $ROOT/scripts/install/fish-plugins.noarch.sh


#--------------------------------------------------
# Powerline Fonts - https://github.com/powerline/fonts
#--------------------------------------------------
dependency ghq brew
install powerline-fonts noarch
