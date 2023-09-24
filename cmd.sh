#!/bin/bash

export PATH=/home/gitpod/.sdkman/candidates/java/current/bin:$PATH:/home/gitpod/.local/share/coursier/bin

if [ -n "$SBT_CUSTOM_PLUGIN" ]; then
    echo "Installing custom plugin"
    mkdir -p "/home/gitpod/.sbt/1.0/plugins/"
    echo -e "$SBT_CUSTOM_PLUGIN" > "/home/gitpod/.sbt/1.0/plugins/custom.scala"
fi

METALS_VERSION="1.0.1"
coursier launch org.scalameta:metals_2.13:$METALS_VERSION --main-class scala.meta.metals.DownloadDependencies
