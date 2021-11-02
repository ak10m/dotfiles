#--------------------------------------------------
# direnv - https://github.com/direnv/direnv
#--------------------------------------------------

#if type direnv >/dev/null 2>&1; then
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
