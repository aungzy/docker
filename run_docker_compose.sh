#!/bin/bash
# Put docker-composer command at the end of this
# e.g., curl [raw script url] | bash -s up -d
docker run -v "$(pwd)":/app \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e COMPOSE_PROJECT_NAME=$(basename "$(pwd)") \
    --rm \
    dduportal/docker-compose:latest
