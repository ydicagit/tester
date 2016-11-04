#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

docker build -t $QUBE_DOCKER_IMAGE_LOCAL .
