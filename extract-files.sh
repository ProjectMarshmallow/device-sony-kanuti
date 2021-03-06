#!/bin/bash

# Use tradition sort
export LC_ALL=C

FP=$(cd ${0%/*} && pwd -P)
export VENDOR=$(basename $(dirname $FP))
export DEVICE=$(basename $FP)
export BOARDCONFIGVENDOR=false
export BOARD_VENDOR_PLATFORM=kanuti
export TARGET_BOARD_PLATFORM=msm8916

../common/extract-files.sh $@
../common/setup-makefiles.sh
