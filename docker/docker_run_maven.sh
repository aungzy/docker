#!/bin/bash

#ARGS="$1"

docker run --rm -it \
-w /app \
-v $HOME/.m2:/root/.m2 \
-v $(pwd):/app \
-p 8080:8080 \
maven:latest "$@"

