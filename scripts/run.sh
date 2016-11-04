#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

if [ -e .env.sh ]; then
 source .env.sh
fi

IMG_NAME=$QUBE_DOCKER_IMAGE_LOCAL

if [ "$RUN_FROM_REMOTE_REGISTRY" == "1" ]; then
   echo "repository pulled from gcloud gcr"
   gcloud docker pull $QUBE_DOCKER_IMAGE
   IMG_NAME=$QUBE_DOCKER_IMAGE
fi

docker rm -f qube_placeholder_1

docker run --name qube_placeholder_1 -d -it -p $DEFAULT_LISTENER_PORT:$DEFAULT_LISTENER_PORT \
  -e DEFAULT_LISTENER_PORT=$DEFAULT_LISTENER_PORT \
  -e DEFAULT_LISTENER_HOST=$DEFAULT_LISTENER_HOST \
  $IMG_NAME
