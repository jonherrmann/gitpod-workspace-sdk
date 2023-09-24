 #!/bin/bash

# Install ZSHRC
cp /home/gitpod/.zshrc.new /home/gitpod/.zshrc
mkdir -p /home/gitpod/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions

export PATH=/home/gitpod/.sdkman/candidates/java/current/bin:$PATH:/home/gitpod/.local/share/coursier/bin

echo "Switching to ZSH"
/home/linuxbrew/.linuxbrew/bin/zsh