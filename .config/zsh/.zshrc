
##### General

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export LANG=ja_JP.UTF-8
export CLICOLOR=true

watch=all

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # exclude '/' for backward-kill-word
REPORTTIME=3                       # report elapsed time (> 3 sec.)

setopt ignoreeof                   # ignore ctrl-D (max: 10 times)
setopt nobeep                      # silent
setopt print_eight_bit


### cache directory

[[ -n "${ZSH_CACHE_DIR}" ]] || export ZSH_CACHE_DIR=${XDG_CACHE_HOME?}/zsh
mkdir -p ${ZSH_CACHE_DIR}


### history

export LESSHISTFILE=-    # disable less history
export HISTFILE=${ZSH_CACHE_DIR}/.histroy
HISTSIZE=50000
SAVEHIST=50000
setopt extendedhistory   # save timestamp and duration
setopt histignorealldups # ignore duplicates
setopt histignorespace   # ignore lines which start with space
setopt incappendhistory  # incremental append
setopt sharehistory      # share history between zsh processes


### RC

source ${ZDOTDIR}/rc/brew.zsh
source ${ZDOTDIR}/rc/direnv.zsh
source ${ZDOTDIR}/rc/asdf.zsh
source ${ZDOTDIR}/rc/completion.zsh
source ${ZDOTDIR}/rc/vim.zsh
source ${ZDOTDIR}/rc/peco.zsh
#source ${ZDOTDIR}/rc/golang.zsh
#source ${ZDOTDIR}/rc/google-sdk.zsh
source ${ZDOTDIR}/rc/alias.zsh
