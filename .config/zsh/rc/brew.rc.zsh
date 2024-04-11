#--------------------------------------------------
# brew - https://brew.sh/
#--------------------------------------------------

() {
  local BREW_BIN=/opt/homebrew/bin/brew

  if [ ! -e "${BREW_BIN}" ]; then
    echo "command not found: brew"

    echo -n "Do you want to install brew? (y/N): "
    if read -q; then
      echo
      # See: https://brew.sh/
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  fi

  if [ -e "${BREW_BIN}" ]; then
    eval "$(${BREW_BIN} shellenv)"
  fi
}
