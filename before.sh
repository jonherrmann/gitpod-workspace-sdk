#!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"
APPS_DIR="$METALS_DIR/apps"
mkdir -p $APPS_DIR

# Fetch other repos
if [ -f "$GITPOD_REPO_ROOT/.meta" ]; then
    if [ ! -f "$GITPOD_REPO_ROOT/.meta-updated" ]; then
        echo "Running meta git update"
        meta git update
        echo $(date) >> "$GITPOD_REPO_ROOT/.meta-updated"
    fi
fi

if [ ! -f ./.jvmopts ]; then
 echo "-Dsbt.coursier.home=$METALS_DIR/coursier" >> .jvmopts
 echo "-Dcoursier.cache=$METALS_DIR/coursier" >> .jvmopts
 echo "-Dsbt-dir=$METALS_DIR/sbt" >> .jvmopts
 echo "-Dsbt-boot=$METALS_DIR/sbt/boot" >> .jvmopts
 echo "-Divy=$METALS_DIR/.ivy2" >> .jvmopts
fi