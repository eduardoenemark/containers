#!/bin/bash

NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' Containerfile)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' Containerfile)

podman build --arch amd64 --cpuset-cpus 0-2 --memory 512m --tag $NAME:$VERSION --file Containerfile
