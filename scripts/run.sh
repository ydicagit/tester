#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..
docker rm -f qube_placeholder_1

docker run --name qube_placeholder_1 -d -it -p 5000:5000 \
  -e DEFAULT_LISTENER_PORT=$DEFAULT_LISTENER_PORT \
  -e DEFAULT_LISTENER_HOST=$DEFAULT_LISTENER_HOST \
  qube_placeholder
