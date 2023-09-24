#!/bin/bash

export PATH=$PATH:/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/.local/share/coursier/bin

if [ -n "$SBT_CUSTOM_PLUGIN" ]; then
    echo "Installing custom plugin"
    mkdir -p "$METALS_DIR/sbt/1.0/plugins/"
    echo "$SBT_CUSTOM_PLUGIN" > "$METALS_DIR/sbt/1.0/plugins/custom.scala"
fi

METALS_VERSION="1.0.1"
coursier launch org.scalameta:metals_2.13:$METALS_VERSION --main-class scala.meta.metals.DownloadDependencies