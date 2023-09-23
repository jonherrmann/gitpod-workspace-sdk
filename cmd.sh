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

if [ -f "$GITPOD_REPO_ROOT/.meta" ]; then
    if [ ! -f "$GITPOD_REPO_ROOT/.meta-updated" ]; then
        meta git update
        echo $(date) >> "$GITPOD_REPO_ROOT/.meta-updated"
    fi
fi
