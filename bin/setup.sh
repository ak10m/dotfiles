#!/bin/bash

set -e

# variables
ROOT=$(cd $(dirname ${0})/../; pwd)

# functions
source $ROOT/scripts/functions.sh

source $ROOT/scripts/setup.$(os_type).sh

echo
rainbow "Setup Complete!!!"
echo
