#!/bin/bash

set -e

function need_to_install_asdf_plugin() {
  local installed=("$(asdf plugin-list)")
  local plugin=${1}
  cprint "[asdf]" 36
  printf " ${plugin} ... "
  if includes ${plugin} ${installed}; then
    cecho "installed" 32
    return 1
  else
    cecho "not installed yet" 31
    return 0
  fi
}

#--------------------------------------------------
# asdf-plugins - https://github.com/asdf-vm/asdf-plugins
#--------------------------------------------------

if need_to_install_asdf_plugin "python"; then
  asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
fi

if need_to_install_asdf_plugin "ruby"; then
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

if need_to_install_asdf_plugin "nodejs"; then
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"
  bash ${ASDF_DIR:-$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring
fi
