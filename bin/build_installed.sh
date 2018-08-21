#!/usr/bin/env bash

if [[ -z $1 ]]
then
    build="latest"
else
    build=$1
fi

echo "---------- BUILD IMAGES VERSION $build -------------"

START_TIME=$SECONDS
echo "Build sawtooth-poet-engine"
docker build -f ../engine/Dockerfile-installed -t socoboy/installed-sawtooth-poet-engine:$build ../
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "Completed build sawtooth-poet-engine in $ELAPSED_TIME seconds"

START_TIME=$SECONDS
echo "Build poet-validator-registry-tp"
docker build -f ../families/Dockerfile-installed -t socoboy/installed-sawtooth-poet-validator-registry-tp:$build ../
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "Completed build poet-validator-registry-tp in $ELAPSED_TIME seconds"