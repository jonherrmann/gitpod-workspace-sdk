FROM gitpod/workspace-full

SHELL ["/bin/bash", "-c"]
USER gitpod

RUN brew install zsh antigen
RUN curl -s "https://get.sdkman.io" | bash
ARG JAVA_VERSION="11.0.15-tem"
RUN . /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk selfupdate force && \
    yes | sdk install java "${JAVA_VERSION}"
COPY .dockershell.sh ~/.zshrc
SHELL ["/home/linuxbrew/.linuxbrew/bin/zsh", "-c"]
RUN zsh ~/.zshrc
