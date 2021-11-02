#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------

# asdf install directory
export ASDF_DIR=$HOME/.asdf

if [ -d "$ASDF_DIR" ]; then
  source $ASDF_DIR/asdf.sh
  #source $ASDF_DIR/completions/asdf.bash

  # nodejs
  export GNUPGHOME="$ASDF_DIR/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
fi
