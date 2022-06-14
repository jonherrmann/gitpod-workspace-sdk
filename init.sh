 #!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"
APPS_DIR="$METALS_DIR/apps"
mkdir -p $APPS_DIR

METALS_VERSION="0.11.6"

export PATH=$PATH:/home/gitpod/.sdkman/candidates/java/current/bin:/home/linuxbrew/.linuxbrew/bin/coursier:$APPS_DIR

echo "-Dsbt.coursier.home=$METALS_DIR/coursier" >> .jvmopts
echo "-Dcoursier.cache=$METALS_DIR/coursier" >> .jvmopts
echo "-Dsbt-dir=$METALS_DIR/sbt" >> .jvmopts
echo "-Dsbt-boot=$METALS_DIR/sbt/boot" >> .jvmopts
echo "-Divy=$METALS_DIR/.ivy2" >> .jvmopts

coursier install --install-dir $APPS_DIR --only-prebuilt=true bloop
coursier install --install-dir $APPS_DIR sbt

coursier launch org.scalameta:metals_2.13:$METALS_VERSION --cache=$METALS_DIR/coursier  --main-class scala.meta.metals.DownloadDependencies
