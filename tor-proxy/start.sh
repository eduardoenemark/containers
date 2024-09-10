#!/bin/bash

CONTAINER_FILE=Containerfile
NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' $CONTAINER_FILE)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' $CONTAINER_FILE)

podman run -d --rm \
  --name tor-proxy-container \
  -p 61988:61988 \
  localhost/$NAME:$VERSION

podman ps
