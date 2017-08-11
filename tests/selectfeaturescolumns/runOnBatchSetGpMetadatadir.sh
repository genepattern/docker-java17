#!/bin/sh


. runConfig.sh
export $GP_METADATA_DIR=$WORKING_DIR/meta
mkdir $GP_METADATA_DIR
. ../../common/testing_scripts/runOnBatch.sh

