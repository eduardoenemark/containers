#!/bin/bash

# Variable for H2 version
H2_VERSION="2.4.240"
H2_SRC_FILE="h2-2025-09-22.zip"

# Function to clean up extracted h2 database files
clear()
{
  echo "Cleaning up any h2 database files..."
  rm -rf temp
  echo "Cleanup complete."
}

clear
echo "Preparing to build h2 database container image..."
mkdir temp
cp -v src/$H2_SRC_FILE temp/
cd temp

echo "Unzip h2 database files..."
unzip $H2_SRC_FILE 1> /dev/null
echo "Unzip complete."

cd ..
echo "Building h2 container image..."
CONTAINER_FILE=Containerfile

read -r NAME VERSION < <(awk '
  BEGIN { to_remove_regex = ".*=|[\"\\\\/]+| +$|^ +" }
  /org.opencontainers.image.ref.name/{gsub(to_remove_regex,"", $0); name=$0}
  /org.opencontainers.image.version/{gsub(to_remove_regex,"", $0); version=$0} 
  END{print name, version}' $CONTAINER_FILE)

podman build \
  --arch amd64 \
  --build-arg CREATED_DATETIME="$(date -u  +'%Y-%m-%dT%H:%M:%S%:z')"  \
  --build-arg H2_VERSION=$H2_VERSION \
  --tag $NAME:$VERSION \
  --file $CONTAINER_FILE

echo "Finished building $NAME:$VERSION"
clear
