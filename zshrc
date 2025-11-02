export PATH=$PATH:$HOME/.local/bin

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git golang zsh-autosuggestions zsh-syntax-highlighting fzf thefuck kubectl)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"

export HISTSIZE=1000000
export SAVEHIST=1000000
export EDITOR=nvim

if [[ -n $SSH_CONNECTION ]]; then
PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
fi

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

mkdir -p ~/.local/share ~/.local/bin

dir=$ZSH_CUSTOM/plugins/zsh-autosuggestions
if [ ! -d $dir ]; then
  echo "📦 Installing zsh-autosuggestions..."
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git $dir
fi
dir=$ZSH_CUSTOM/plugins/zsh-syntax-highlighting
if [ ! -d $dir ]; then
  echo "📦 Installing zsh-syntax-highlighting..."
  git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $dir
fi

if [ ! -f ~/.fzf.zsh ]; then
  echo "📦 Installing fzf..."
  git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install --bin
fi

export PATH=$PATH:$HOME/.cargo/bin
if ! command -v rustc &> /dev/null; then
  echo "📦 Installing rust..."
  curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

if ! command -v tree-sitter &> /dev/null; then
  echo "📦 Installing tree-sitter..."
  cargo install --locked tree-sitter-cli
fi

export PATH=$PATH:$HOME/go/bin
if ! command -v go &> /dev/null && [ "$(uname -s)" = "Linux" ]; then
  echo "📦 Installing go..."
  curl -fLo- https://go.dev/dl/go1.25.1.linux-amd64.tar.gz | tar -xzf - -C ~/.local/share && \
  ln -sf ~/.local/share/go/bin/go ~/.local/bin/go
fi

if ! command -v nvim &> /dev/null; then
  echo "📦 Installing neovim..."
  if [ "$(uname -s)" = "Darwin" ]; then
    brew install neovim
  elif [ "$(uname -s)" = "Linux" ]; then
    url=https://github.com/neovim/neovim-releases/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
    curl -fLo- $url | tar -xzf - -C ~/.local/share
    ln -sf ~/.local/share/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
  fi
fi

if ! command -v zellij &> /dev/null; then
  echo "📦 Installing zellij..."
  if [ "$(uname -s)" = "Darwin" ]; then
    os=aarch64-apple-darwin
  elif [ "$(uname -s)" = "Linux" ]; then
    os=x86_64-unknown-linux-musl
  fi
  url=https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-$os.tar.gz
  curl -fLo- $url | tar -xzf - -C ~/.local/bin zellij
fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/mo/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
