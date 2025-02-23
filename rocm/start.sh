#!/bin/bash

CONTAINER_FILE=Containerfile
NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' $CONTAINER_FILE)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' $CONTAINER_FILE)

podman run -it --rm \
  --name ${NAME}_${VERSION} \
  --privileged \ 
  --device /dev/kfd --device /dev/dri \
  --security-opt seccomp=unconfined \
  --cap-add=SYS_PTRACE \
  --ipc=host --network=host \
  --group-add video \
  localhost/${NAME}:${VERSION}
