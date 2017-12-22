## XDG Base Directory Specification

[[ -n "$XDG_CONFIG_HOME" ]] || export XDG_CONFIG_HOME=$HOME/.config
[[ -n "$XDG_CACHE_HOME"  ]] || export XDG_CACHE_HOME=$HOME/.cache
[[ -n "$XDG_DATA_HOME"   ]] || export XDG_DATA_HOME=$HOME/.local/share

# zsh config directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# zsh cache directory
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
mkdir -p $ZSH_CACHE_DIR
