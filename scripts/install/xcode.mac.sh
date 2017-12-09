#!/bin/bash

set -e

xcode_check=$((xcode-\select --install) 2>&1) && :
xcode_not_installed="xcode-select: note: install requested for command line developer tools"

if [[ "$xcode_check" == "$xcode_not_installed" ]]; then
  osascript -e 'tell app "System Events" to display dialog "`XCode Command-Line Tools` missing.\n\nPlease install XCode and try again." buttons "OK" default button 1 with title "required XCode Command-Line Tools"'
  exit;
fi
