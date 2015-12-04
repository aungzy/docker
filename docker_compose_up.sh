#!/bin/bash
docker run -v "$(pwd)":/app \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e COMPOSE_PROJECT_NAME=$(basename "$(pwd)") \
    --rm \
    dduportal/docker-compose:latest up -d
