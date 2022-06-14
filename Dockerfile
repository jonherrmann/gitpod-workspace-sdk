FROM gitpod/workspace-full

SHELL ["/bin/bash", "-c"]
USER gitpod

RUN curl -s "https://get.sdkman.io" | bash
ARG JAVA_VERSION="11.0.15-tem"
RUN . /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk selfupdate force && \
    yes | sdk install java "${JAVA_VERSION}"

ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current/
RUN brew install zsh antigen coursier

COPY .dockershell.sh /home/gitpod/.zshrc
COPY init.sh /home/gitpod/init.sh
COPY cmd.sh /home/gitpod/cmd.sh

SHELL ["/home/linuxbrew/.linuxbrew/bin/zsh", "-c"]
RUN zsh /home/gitpod/.zshrc
