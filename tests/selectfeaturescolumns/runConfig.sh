#!/bin/sh

TEST_ROOT=$PWD
TASKLIB=$TEST_ROOT/src
INPUT_FILE_DIRECTORIES=$TEST_ROOT/data
WORKING_DIR=$TEST_ROOT/job_1

COMMAND_LINE="java -cp $TASKLIB/SelectFeaturesColumns.jar:$TASKLIB/gp-modules.jar org.genepattern.modules.selectfeaturescolumns.SelectFeaturesColumns $INPUT_FILE_DIRECTORIES/all_aml_train.gct $WORKING_DIR/testout.gct -t1-2"

# docker local only vars
DOCKER_CONTAINER=genepattern/docker-java17

# aws batch only vars 
#S3_ROOT=s3://moduleiotest
S3_ROOT=s3://gpbeta
JOB_DEFINITION_NAME="Java17_Oracle_Generic"
JOB_ID=gp_job_JAVA17_$1
JOB_QUEUE=TedTest


