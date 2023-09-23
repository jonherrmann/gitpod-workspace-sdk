#!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"
APPS_DIR="$METALS_DIR/apps"
mkdir -p $APPS_DIR

export PATH=$PATH:/home/gitpod/.sdkman/candidates/java/current/bin:/home/linuxbrew/.linuxbrew/bin/coursier:$APPS_DIR

if [ -n "$SBT_CUSTOM_PLUGIN" ]; then
    echo "Installing custom plugin"
    mkdir -p "$METALS_DIR/sbt/1.0/plugins/"
    echo "$SBT_CUSTOM_PLUGIN" > "$METALS_DIR/sbt/1.0/plugins/custom.scala"
fi

METALS_VERSION="1.0.1"
coursier install --install-dir $APPS_DIR --only-prebuilt=true bloop
coursier launch org.scalameta:metals_2.13:$METALS_VERSION --cache=$METALS_DIR/coursier  --main-class scala.meta.metals.DownloadDependencies