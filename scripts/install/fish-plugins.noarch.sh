#!/bin/bash

function fisher_install() {
  local package=${1}
  cprint "[fisher]" 36
  echo " ${package}"
  $(which fish) -c "eval (fisher install -q ${package})"
}

fisher_install omf/theme-bobthefish
fisher_install z
fisher_install 0rax/fish-bd
fisher_install oh-my-fish/plugin-peco
fisher_install yoshiori/fish-peco_select_ghq_repository
