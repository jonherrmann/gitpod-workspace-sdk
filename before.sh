#!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"
APPS_DIR="$METALS_DIR/apps"
mkdir -p $APPS_DIR

if [ ! -f "$GITPOD_REPO_ROOT/.jvmopts" ]; then
    echo "-Dsbt.coursier.home=$METALS_DIR/coursier" >> .jvmopts
    echo "-Dcoursier.cache=$METALS_DIR/coursier" >> .jvmopts
    echo "-Dsbt-dir=$METALS_DIR/sbt" >> .jvmopts
    echo "-Dsbt-boot=$METALS_DIR/sbt/boot" >> .jvmopts
    echo "-Divy=$METALS_DIR/.ivy2" >> .jvmopts

fi

coursier install --install-dir $APPS_DIR sbt
coursier install --install-dir $APPS_DIR sbt-launcher

echo "export APPS_DIR=$APPS_DIR" >> ~/.bashrc
echo "export METALS_DIR=$METALS_DIR" >> ~/.bashrc

echo "export PATH=\$PATH:/home/gitpod/.sdkman/candidates/java/current/bin:/home/linuxbrew/.linuxbrew/bin/coursier:$APPS_DIR" >> ~/.bashrc