#!/bin/bash

CONTAINER_FILE=Containerfile
NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' $CONTAINER_FILE)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' $CONTAINER_FILE)

podman build --arch amd64 --tag $NAME:$VERSION --file $CONTAINER_FILE
