 #!/bin/bash

# Install ZSHRC
cp /home/gitpod/.zshrc.new /home/gitpod/.zshrc
mkdir -p /home/gitpod/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions

echo "Switching to ZSH"
/home/linuxbrew/.linuxbrew/bin/zsh