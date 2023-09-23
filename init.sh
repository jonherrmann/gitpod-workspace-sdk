 #!/bin/bash

# Fetch other repos
if [ -f "$GITPOD_REPO_ROOT/.meta" ]; then
    if [ ! -f "$GITPOD_REPO_ROOT/.meta-updated" ]; then
        echo "Running meta git update"
        meta git update
        echo $(date) >> "$GITPOD_REPO_ROOT/.meta-updated"
    fi
fi

# Install ZSHRC
cp /home/gitpod/.zshrc.new /home/gitpod/.zshrc

# Install Metals
METALS_DIR="$GITPOD_REPO_ROOT/.metals"
APPS_DIR="$METALS_DIR/apps"
mkdir -p $APPS_DIR

METALS_VERSION="1.0.1"

export PATH=$PATH:/home/gitpod/.sdkman/candidates/java/current/bin:/home/linuxbrew/.linuxbrew/bin/coursier:$APPS_DIR

if [ ! -f ./.jvmopts ]; then
 echo "-Dsbt.coursier.home=$METALS_DIR/coursier" >> .jvmopts
 echo "-Dcoursier.cache=$METALS_DIR/coursier" >> .jvmopts
 echo "-Dsbt-dir=$METALS_DIR/sbt" >> .jvmopts
 echo "-Dsbt-boot=$METALS_DIR/sbt/boot" >> .jvmopts
 echo "-Divy=$METALS_DIR/.ivy2" >> .jvmopts
fi

coursier install --install-dir $APPS_DIR --only-prebuilt=true bloop
coursier install --install-dir $APPS_DIR sbt

coursier launch org.scalameta:metals_2.13:$METALS_VERSION --cache=$METALS_DIR/coursier  --main-class scala.meta.metals.DownloadDependencies

