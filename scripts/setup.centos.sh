#!/bin/bash

set -e

##### variables
ROOT=$(cd $(dirname ${0})/../; pwd)

##### functions
source $ROOT/scripts/functions.sh


require yarn yum
