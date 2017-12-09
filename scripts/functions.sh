#!/bin/bash

function os_type() {
  if [ "$(uname)" == 'Darwin' ]; then
    echo 'mac'
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    echo 'linux'
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    echo 'cygwin'
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
}

function is_os() {
  local os=$(os_type)
  if [ "${os}" == "${1}" ]; then
    return 0
  else
    return 1
  fi
}

# colored output

# color (3x), background (4x)
#
#   0: Black
#   1: Red
#   2: Green
#   3: Yellow
#   4: Blue
#   5: Magenta
#   6: Cyan
#   7: White
#
# mode
#
#   1: bold
#   2: low intensity
#   4: underline
#   5: blink
#   7: reverse video
#   8: invisible text
#
function cesc() {
  local code=$(IFS=\;; echo "${*}")
  echo "\e[${code}m"
}
function cprint() {
  local text=${1}
  shift
  printf "$(cesc ${*})${text}$(cesc)"
}
function cecho() {
  local text=${1}
  shift
  printf "$(cesc ${*})${text}$(cesc)\n"
}

function rainbow() {
  local text=${1}
  local colors=(35 31 33 32 36 34)
  for i in $(seq 1 ${#text})
  do
    local mod=$(($i % 6))
    local cc=${colors[mod]}
    cprint "${text:i-1:1}" $cc
  done
}

# utilities
function includes() {
  local source=${1}
  local targets=${@:2:${#}}
  for target in $targets; do
    if [[ "$source" == "$target" ]]; then
      return 0
    fi
  done
  return 1
}

# verify command
function has_command() {
  type ${1} > /dev/null 2>&1
}

function require() {
  local cmd="${1}"
  cprint "[require]" 36
  printf " ${cmd} ... "
  if has_command ${cmd} ; then
    cecho "installed" 32
  else
    cecho "not installed yet" 31
    local os=$(os_type)
    local scripts_dir=$(cd $(dirname $BASH_SOURCE); pwd)/install
    local script="${1}.${2:-${os}}.sh"
    source "${scripts_dir}/${script}"
  fi
}
