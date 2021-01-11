# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load antigen
source $HOME/.antigen.zsh

# load plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen bundle vscode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# load theme
antigen theme romkatv/powerlevel10k

# apply
antigen apply

# aliases
if [[ $$OSTYPE == darwin* ]]; then
    alias x86="arch -x86_64"
    alias ibrew="arch -x86_64 /usr/local/bin/brew"
fi

# wsl x server
if [[ $(uname -r) == ^*Microsoft$ ]]; then
    export DISPLAY=$(cat /etc/resolve.conf | grep nameserver | awk '{print $2; exit;}'):0.0
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

