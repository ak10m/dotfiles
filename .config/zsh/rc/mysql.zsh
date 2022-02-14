#--------------------------------------------------
# MySQL
#--------------------------------------------------

# MYSQL80_BIN_DIR=/opt/homebrew/opt/mysql-client/bin
# [[ -d "${MYSQL80_BIN_DIR}" ]] && export PATH="${MYSQL80_BIN_DIR}:$PATH"


# mysql-client@5.7 is keg-only, which means it was not symlinked into /opt/homebrew,
# because this is an alternate version of another formula.
#
# If you need to have mysql-client@5.7 first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/mysql-client@5.7/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find mysql-client@5.7 you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/mysql-client@5.7/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/mysql-client@5.7/include"
#
# For pkg-config to find mysql-client@5.7 you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client@5.7/lib/pkgconfig"

() {
  local MYSQL57_BIN_DIR=/opt/homebrew/opt/mysql-client@5.7/bin
  [[ -d "${MYSQL57_BIN_DIR}" ]] && export PATH="${MYSQL57_BIN_DIR}:$PATH"
}
