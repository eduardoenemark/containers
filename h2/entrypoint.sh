#!/bin/bash

H2_CLASSPATH="/h2/bin/h2-${H2_VERSION}.jar:$H2DRIVERS:$CLASSPATH"

echo "H2 Version: $H2_VERSION"
echo "H2 Classpath: $H2_CLASSPATH"
echo "H2 Server Arguments: $@"
echo "[`date -Iseconds`] Starting H2 Database Server..."

java -cp "$H2_CLASSPATH" org.h2.tools.Server "$@"
