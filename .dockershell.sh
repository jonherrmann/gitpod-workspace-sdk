if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

AUTOENV_FILE_ENTER=".autoenv"

source /home/linuxbrew/.linuxbrew/Cellar/antigen/*/share/antigen/antigen.zsh
autoload -U colors && colors
setopt promptsubst
antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen theme cloud
antigen bundle Tarrasch/zsh-autoenv
antigen bundle matthieusb/zsh-sdkman
antigen apply

#bindkey '^H' backward-kill-word

alias kaj="killall -9 java"
