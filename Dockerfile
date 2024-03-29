FROM gitpod/workspace-full

SHELL ["/bin/bash", "-c"]
USER gitpod

ARG JAVA_VERSION="11.0.20.1-librca"
ARG SCALA_VERSION="2.13.9"
ARG SBT_VERSION="1.8.3"

RUN curl -s "https://get.sdkman.io" | bash
RUN . /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk selfupdate force && \
    yes | sdk install java "${JAVA_VERSION}" && \
    sdk install sbt $SBT_VERSION && \
    sdk install scala $SCALA_VERSION

ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current/

RUN brew install \
    antigen \
    ctop

RUN file="$HOME/.bashrc.d/99-java-path.sh" \
    && echo "export PATH=/home/gitpod/.sdkman/candidates/java/current/bin:\$PATH" >> "${file}" \
    && chmod +x "${file}"

COPY .dockershell.sh /home/gitpod/.zshrc.new
COPY init.sh /home/gitpod/init.sh
COPY cmd.sh /home/gitpod/cmd.sh
COPY before.sh /home/gitpod/before.sh
RUN sudo chmod +x \
    /home/gitpod/init.sh \
    /home/gitpod/cmd.sh \
    /home/gitpod/before.sh \
    /home/gitpod/.zshrc.new

ENV SHELL=/home/linuxbrew/.linuxbrew/bin/zsh

SHELL ["/home/linuxbrew/.linuxbrew/bin/zsh", "-c"]
RUN zsh /home/gitpod/.zshrc.new
