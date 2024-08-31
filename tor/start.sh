#!/bin/bash

NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' Containerfile)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' Containerfile)

mkdir -p ./etc/tor ./var/log/tor ./var/lib/tor

podman run -it --rm \
  -v $(pwd)/etc/tor:/etc/tor \
  -v $(pwd)/var/log/tor:/var/log/tor \
  -v $(pwd)/var/lib/tor:/var/lib/tor \
  localhost/$NAME:$VERSION
