#!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"
APPS_DIR="$METALS_DIR/apps"
mkdir -p $APPS_DIR

export PATH=$PATH:/home/gitpod/.sdkman/candidates/java/current/bin:/home/linuxbrew/.linuxbrew/bin/coursier:$APPS_DIR