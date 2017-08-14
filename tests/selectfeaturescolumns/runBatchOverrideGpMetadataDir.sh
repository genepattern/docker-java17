#!/bin/sh
# test with override of the $GP_METADATA_DIR

. runConfig.sh
export GP_METADATA_DIR=$WORKING_DIR/meta
mkdir $GP_METADATA_DIR

. ../../common/testing_scripts/runOnBatch.sh

