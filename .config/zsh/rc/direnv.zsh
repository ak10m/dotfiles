#--------------------------------------------------
# direnv - https://github.com/direnv/direnv
#--------------------------------------------------

if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
