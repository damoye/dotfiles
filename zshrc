export PATH=$PATH:$HOME/go/bin

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git golang zsh-autosuggestions zsh-syntax-highlighting fzf thefuck kubectl)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"

export HISTSIZE=1000000
export SAVEHIST=1000000

if [[ -n $SSH_CONNECTION ]]; then
PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
fi

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
