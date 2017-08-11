#!/bin/sh

. runConfig.sh

export GP_METADATA_DIR=$WORKING_DIR/meta

#. ../../common/testing_scripts/runLocal.sh

# ##### NEW PART FOR SCRIPT INSTEAD OF COMMAND LINE ################################
# Make the input file directory since we need to put the script to execute in it
cd $TEST_ROOT
mkdir -p $WORKING_DIR
mkdir -p $WORKING_DIR/.gp_metadata
EXEC_SHELL=$WORKING_DIR/.gp_metadata/local_exec.sh

echo "#!/bin/bash\n" > $EXEC_SHELL
echo $COMMAND_LINE >>$EXEC_SHELL
echo "\n " >>$EXEC_SHELL

chmod a+x $EXEC_SHELL


REMOTE_COMMAND="runLocal.sh $TASKLIB $INPUT_FILE_DIRECTORIES $S3_ROOT $WORKING_DIR $EXEC_SHELL"

echo "Container will execute $REMOTE_COMMAND  <EOM>\n"
echo "META + $GP_METADATA_DIR"

docker run -e GP_METADATA_DIR="$GP_METADATA_DIR" -v $GP_METADATA_DIR:$GP_METADATA_DIR -v $TASKLIB:$TASKLIB -v $INPUT_FILE_DIRECTORIES:$INPUT_FILE_DIRECTORIES -v $WORKING_DIR:$WORKING_DIR  $DOCKER_CONTAINER $REMOTE_COMMAND



