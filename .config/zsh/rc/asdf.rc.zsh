#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------

() {
  export ASDF_CONFIG_FILE=${HOME}/.config/asdf/.asdfrc
  export ASDF_DIR=${HOME}/.asdf
  export ASDF_DATA_DIR=${XDG_CACHE_HOME}/asdf

  if [ ! -e "${ASDF_DIR}" ]; then
    echo "command not found: asdf"

    echo -n "Do you want to install asdf? (y/N): "
    if read -q; then
      echo
      git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch v0.14.0
    fi
  fi

  if [ -d "${ASDF_DIR}" ]; then
    source ${ASDF_DIR}/asdf.sh

    # append completions to fpath
    fpath=(${ASDF_DIR}/completions $fpath)
    # initialise completions with ZSH's compinit
    autoload -Uz compinit && compinit

    # nodejs
    export GNUPGHOME="${ASDF_DIR}/keyrings/nodejs" && mkdir -p "${GNUPGHOME}" && chmod 0700 "${GNUPGHOME}"

    # java
    if [ -e "${ASDF_DIR}/plugins/java/set-java-home.zsh" ]; then
      source ${ASDF_DIR}/plugins/java/set-java-home.zsh
    fi
  fi
}
