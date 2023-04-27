#!/bin/bash

# Get the container name and image name from command line arguments
CONTAINER_NAME="$1"

# Check if the container is running
if docker ps -a --format "{{.Names}}" | grep -q "^$CONTAINER_NAME$"; then
    # Stop and remove the container
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Check if the image exists
if docker images --format "{{.Repository}}:{{.Tag}}" | grep nginx:1.0; then
    # Remove the image
    docker rmi nginx:1.0
fi
