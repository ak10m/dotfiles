set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x EDITOR vim

#--------------------------------------------------
# vim
#--------------------------------------------------
set -x VIMINIT 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC' 

#--------------------------------------------------
# direnv
#--------------------------------------------------
if type direnv >/dev/null 2>&1
  eval (direnv hook fish)
end

#--------------------------------------------------
# anyenv
#--------------------------------------------------
set -x ANYENV_ROOT $HOME/.anyenv
if test -d $ANYENV_ROOT
  set -x PATH $ANYENV_ROOT/bin $PATH
  status --is-interactive; and source (anyenv init -|psub)
end

