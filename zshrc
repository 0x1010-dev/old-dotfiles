# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load antigen
source $HOME/.antigen.zsh

# plugin configs
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

# load plugins
antigen use oh-my-zsh
antigen bundle z
antigen bundle git
antigen bundle docker
antigen bundle vscode
antigen bundle mattberther/zsh-pyenv
# antigen bundle lukechilds/zsh-nvm
antigen bundle greymd/docker-zsh-completion
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# load theme
antigen theme romkatv/powerlevel10k

# apply
antigen apply

# aliases
if [[ $OSTYPE == darwin* ]]; then
    alias x86="arch -x86_64"
    alias ibrew="arch -x86_64 /usr/local/bin/brew"
fi

alias psh="poetry shell"
alias padd="poetry add"
alias premove="poetry remove"
alias pinstall="poetry install"
alias pupdate="poetry update"

# wsl x server
if [[ $(uname -r) == ^*Microsoft$ ]]; then
    export DISPLAY=$(cat /etc/resolve.conf | grep nameserver | awk '{print $2; exit;}'):0.0
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k.zsh.
[[ ! -f ~/.dotfiles/p10k.zsh ]] || source ~/.dotfiles/p10k.zsh
