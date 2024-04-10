# .zshrc: users generic .zshrc file for zsh(1)
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

## General
#

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export LANG=ja_JP.UTF-8
export CLICOLOR=true

watch=all

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # exclude '/' for backward-kill-word
REPORTTIME=3                       # report elapsed time (> 3 sec.)

setopt ignoreeof # ignore ctrl-D (max: 10 times)
setopt nobeep    # silent
setopt print_eight_bit


## Prompt
#

PROMPT='%F{10}%n@%m%f:%F{12}%4(~,%-1~/.../%1~,%~)%f
%0(?.%#.%F{9}%#%f) '
RPROMPT='%*'

case $TERM in
xterm*|rxvt*)
  function _update_title(){print -Pn '\e]0;%n@%m:%4(~,%-1~/.../%1~,%~)\a'}
  precmd_functions+=(_update_title) ;;
esac


## Changing Directory
#

# cd -[tab] (do not push duplicates, reverse order)
setopt autopushd pushdignoredups pushdminus

# list directory contents after each cd
#function _autols(){print -P "%F{8}$(COLUMNS=$COLUMNS command ls -CF)%f"}
#chpwd_functions+=(_autols)


## History
#

export LESSHISTFILE=-    # disable less history
export HISTFILE=${ZSH_CACHE_DIR}/.history
HISTSIZE=50000
SAVEHIST=50000
setopt extendedhistory   # save timestamp and duration
setopt histignorealldups # ignore duplicates
setopt histignorespace   # ignore lines which start with space
setopt incappendhistory  # incremental append
setopt sharehistory      # share history between zsh processes


## Completion
#

autoload -Uz compinit && compinit -d "$ZSH_CACHE_DIR/.zcompdump"
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%F{8}# %d%f'    # group title
zstyle ':completion:*' group-name ''           # show all groups
zstyle ':completion:*' list-separator ''       # default '--'
zstyle ':completion:*' list-colors '=*=01;30'  # color=gray
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select=2
zstyle ':completion:*:functions' ignored-patterns '_*'
setopt listpacked    # smaller completion list
setopt menucomplete  # insert matches immediately
setopt extendedglob globdots nocaseglob # advanced filename generation

## Keybind
#

setopt noflowcontrol # disable flow control (for ^S/^Q shortcut)
bindkey -e           # emacs keybind
bindkey '\e[Z' reverse-menu-complete # [shift]+[tab]
bindkey '^F'   forward-word
bindkey '^B'   backward-word
bindkey '^R'   history-incremental-pattern-search-backward
bindkey '^S'   history-incremental-pattern-search-forward
bindkey '^J'   run-help

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end


## Polyfill functions
#

which which >/dev/null 2>&1 || {
  which() {
    command -v "$1" 2>/dev/null |
    awk 'match($0,/^\//){print; ok=1;}
         END {if(ok==0){print "which: not found" > "/dev/stderr"; exit 1}}'
  }
}



source ${ZDOTDIR}/rc/brew.rc.zsh
#source ${ZDOTDIR}/rc/completion.rc.zsh
source ${ZDOTDIR}/rc/prompt.rc.zsh
source ${ZDOTDIR}/rc/direnv.rc.zsh
source ${ZDOTDIR}/rc/asdf.rc.zsh
source ${ZDOTDIR}/rc/vim.rc.zsh
source ${ZDOTDIR}/rc/peco.rc.zsh
source ${ZDOTDIR}/rc/docker.rc.zsh
source ${ZDOTDIR}/rc/google-sdk.rc.zsh
source ${ZDOTDIR}/rc/alias.rc.zsh


### custom command
export PATH="${ZDOTDIR}/bin:${PATH}"

# override zshrc
test -r "${ZDOTDIR}/.zshrc.mine" && source "${ZDOTDIR}/.zshrc.mine" || true
