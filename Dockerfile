FROM gitpod/workspace-full

SHELL ["/bin/bash", "-c"]
USER gitpod

RUN curl -s "https://get.sdkman.io" | bash
ARG JAVA_VERSION="11.0.20.1-librca"
RUN . /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk selfupdate force && \
    yes | sdk install java "${JAVA_VERSION}"

ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current/

RUN brew install \
    antigen \
    coursier \
    plantuml \
    ctop

Run npm i -g \
    meta

COPY .dockershell.sh /home/gitpod/.zshrc.new
COPY init.sh /home/gitpod/init.sh
COPY cmd.sh /home/gitpod/cmd.sh
COPY before.sh /home/gitpod/before.sh
RUN sudo chmod +x \
    /home/gitpod/init.sh \
    /home/gitpod/cmd.sh \
    /home/gitpod/before.sh \
    /home/gitpod/.zshrc.new

SHELL ["/bin/zsh", "-c"]
RUN zsh /home/gitpod/.zshrc.new
