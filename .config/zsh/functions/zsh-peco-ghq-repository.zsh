
if (( $+commands[peco] && $+commands[ghq] )); then
  function peco_select_ghq_repository() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")

    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
    #zle -R -c       # refresh
  }

  zle -N peco_select_ghq_repository
  bindkey '^]' peco_select_ghq_repository
fi
