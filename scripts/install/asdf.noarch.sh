#!/bin/bash

set -e

#--------------------------------------------------
# asdf - https://github.com/asdf-vm/asdf
#--------------------------------------------------
git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR:-$HOME/.asdf} --branch v0.4.0
