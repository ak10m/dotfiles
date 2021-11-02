#

BREW_BIN=/opt/homebrew/bin/brew

if [ ! -e ${BREW_BIN} ]; then
  echo "brew is not found."

  echo -n "Do you want to install brew? (y/N): "
  if read -q; then
    # https://brew.sh/
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi

if [ -e ${BREW_BIN} ]; then
  eval "$(${BREW_BIN} shellenv)"
fi
