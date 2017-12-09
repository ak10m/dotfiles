#!/bin/bash

set -e

##### variables
ROOT=$(cd $(dirname ${0})/../; pwd)

##### functions
source $ROOT/scripts/functions.sh

##### setup
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


#--------------------------------------------------
# direnv - https://github.com/direnv/direnv
#--------------------------------------------------
require direnv brew
eval "$(direnv hook bash)"


#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------
export ASDF_DIR=$HOME/.asdf
require asdf noarch
source $ASDF_DIR/asdf.sh
source $ASDF_DIR/completions/asdf.bash

# Plugins
require gpg brew
source $ROOT/scripts/install/asdf-plugins.noarch.sh


#--------------------------------------------------
# neovim - https://github.com/neovim/neovim
#--------------------------------------------------
require nvim brew

if [ ! -e ~/.config/nvim ]; then
  cecho "[link] $ROOT/.config/vim ~/.config/nvim" 35
  mkdir -p ~/.config
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

if [ ! -e ~/.config/fish/functions/fisher.fish ]; then
  cecho "[install] fisherman" 35
  mkdir -p ~/.config/fish/functions
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fi


#--------------------------------------------------
# Powerline Fonts - https://github.com/powerline/fonts
#--------------------------------------------------
cat << EOT
==== Install Powerline fonts

ghq get powerline/fonts
ghq look powerline/fonts
./install.sh

EOT
