set -x EDITOR vim

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

