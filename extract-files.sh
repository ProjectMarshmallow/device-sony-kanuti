#!/bin/bash

# Use tradition sort
export LC_ALL=C

FP=$(cd ${0%/*} && pwd -P)
export VENDOR=$(basename $(dirname $FP))
export DEVICE=$(basename $FP)
export BOARDCONFIGVENDOR=false
export BOARD_VENDOR_PLATFORM=kanutis
export TARGET_BOARD_PLATFORM=msm8916

../sony_common/extract-files.sh $@
../sony_common/setup-makefiles.sh
