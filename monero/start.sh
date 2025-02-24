#!/bin/bash

CONTAINER_FILE=Containerfile
NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' $CONTAINER_FILE)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' $CONTAINER_FILE)
CRYPTO_HOST_HOME=~/blockchain/monero

podman run --name ${NAME}_${VERSION} \
        --privileged \
        --rm -it \
        --cpus 6 \
        --memory 16g \
        --device=/dev/dri \
        --device=/dev/kfd \
        --security-opt seccomp=unconfined \
        --cap-add=SYS_PTRACE \
        --ipc=host \
        --network=host \
        --group-add video \
        -v $XAUTHORITY:$XAUTHORITY:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v ${CRYPTO_HOST_HOME}:/monero \
        -e DISPLAY \
        -p 18080:18080 \
        -p 18081:18081 \
        -p 18082:18082 \
        -p 18083:18083 \
        -p 18089:18089 \
        -p 38080:38080 \
        -p 38081:38081 \
        -p 37889:37889 \
        -p 37888:37888 \
        -p 3333:3333 \
       localhost/${NAME}:${VERSION} /bin/bash
