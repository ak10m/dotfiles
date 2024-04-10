#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------

() {
  # asdf install directory
  export ASDF_DIR=${XDG_CACHE_HOME}/asdf

  if [ -d "${ASDF_DIR}" ]; then
    source ${ASDF_DIR}/asdf.sh
    #source $ASDF_DIR/completions/asdf.bash
    fpath=(${ASDF_DIR}/completions $fpath)
    autoload -Uz compinit && compinit

    # nodejs
    export GNUPGHOME="${ASDF_DIR}/keyrings/nodejs" && mkdir -p "${GNUPGHOME}" && chmod 0700 "${GNUPGHOME}"

    # java
    if [ -e "${ASDF_DIR}/plugins/java/set-java-home.zsh" ]; then
      source ${ASDF_DIR}/plugins/java/set-java-home.zsh
    fi
  fi
}
