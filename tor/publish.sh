#!/bin/bash

NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' Containerfile)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' Containerfile)

docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname
