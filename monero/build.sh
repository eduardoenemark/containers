#!/bin/bash

CONTAINER_FILE=Containerfile
NAME=$(awk -v FS== '/org.opencontainers.image.ref.name/{print $2}' $CONTAINER_FILE)
VERSION=$(awk -v FS== '/org.opencontainers.image.version/{print $2}' $CONTAINER_FILE)
AUTHORS=$(awk -v FS== '/org.opencontainers.image.authors/{print $2}' $CONTAINER_FILE)

MONERO_GUI=monero-gui-v0.18.3.4
P2POOL=p2pool-v4.3-linux-x64

tar xvf ./${MONERO_GUI}.tar.xz --use-compress-program='xz -dT3' \
  && tar xvf ./${P2POOL}.tar.xz --use-compress-program='xz -dT3' \
  && podman build --arch amd64 --label author="$AUTHORS" --tag $NAME:$VERSION --file $CONTAINER_FILE \
  && rm -rfv $MONERO_GUI $P2POOL ;

podman images
