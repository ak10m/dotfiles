#!/bin/zsh

#--------------------------------------------------
# docker
#--------------------------------------------------

() {
  export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

  mkdir -p ${DOCKER_CONFIG}/cli-plugins
  mkdir -p ${ZDOTDIR?}/completion

  # docker completion
  local DOCKER_COMPLETION="${ZDOTDIR?}/completion/_docker"

  if [ ! -e "${DOCKER_COMPLETION}" ]; then
    curl -s -o ${DOCKER_COMPLETION} https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
  fi

  # install docker compose plugin
  local DOCKER_COMPOSE_VERSION=2.26.1
  local DOCKER_COMPOSE_BIN="${DOCKER_CONFIG}/cli-plugins/docker-compose"
  local DOCKER_COMPOSE_DOWNLOAD_URL="https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-darwin-aarch64"

  if [ ! -e "${DOCKER_COMPOSE_BIN}" ]; then
    curl -SL ${DOCKER_COMPOSE_DOWNLOAD_URL} -o ${DOCKER_COMPOSE_BIN}
    chmod +x ${DOCKER_COMPOSE_BIN}
  fi

  # docker compose completion
  local DOCKER_COMPOSE_COMPLETION="${ZDOTDIR}/completion/_docker-compose"
  local DOCKER_COMPOSE_COMPLETION_URL="https://raw.githubusercontent.com/docker/compose/${DOCKER_COMPOSE_VERSION}/contrib/completion/zsh/_docker-compose"

  if [ ! -e "${DOCKER_COMPOSE_COMPLETION}" ]; then
    curl -SL ${DOCKER_COMPOSE_COMPLETION_URL} -o ${DOCKER_COMPOSE_COMPLETION}
  fi
}
