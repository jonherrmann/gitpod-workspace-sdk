#!/bin/bash

if [ -n "$SBT_CUSTOM_PLUGIN" ]; then
    echo "Installing custom plugin"
    mkdir -p "/home/gitpod/.sbt/1.0/plugins/"
    echo -e "$SBT_CUSTOM_PLUGIN" > "/home/gitpod/.sbt/1.0/plugins/custom.scala"
fi
