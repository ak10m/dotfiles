# XDG Base Directory
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
#export XDG_STATE_HOME=${HOME}/.local/state

mkdir -p ${XDG_CONFIG_HOME} ${XDG_CACHE_HOME} ${XDG_DATA_HOME}

# config directory
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh
mkdir -p ${ZDOTDIR}
