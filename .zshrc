# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew brew-cask bower composer node npm sublime zsh-reload gem history history-substring-search terminalapp)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='subl'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

source $(brew --prefix php-version)/php-version.sh && php-version 5

DEFAULT_USER=""

source $HOME/.aliases
source $HOME/.exports
source $HOME/.functions
source $HOME/.kontest

eval "$(gulp --completion=zsh)"
eval "$(rbenv init -)"
