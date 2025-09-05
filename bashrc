. "$HOME/.cargo/env"
source $HOME/.local/bin/env  # uv
export PATH="/Users/egormarin/.pixi/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# bun completions
[ -s "/Users/egormarin/.bun/_bun" ] && source "/Users/egormarin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export EDITOR=vim VISUAL=vim
export STARSHIP_CONFIG=$HOME/.config/starship.toml

alias vi='nvim'
alias vim='nvim'
alias ls='exa'
alias ll='exa -lah --sort=modified --icons --git'
alias l='exa -l --group-directories-first'
alias htop='btm --theme nord-light'
alias myupdate='cargo install cargo-update && cargo install-update -a && omz update -y && rustup update'

alias vnot="deactivate"
alias mkv="uv venv"
alias vrun="source .venv/bin/activate"
alias j='just -g'

cd() {
  if [ -n "$1" ]; then
    z "$@" && ll --group-directories-first
  else
    z ~ && ll --group-directories-first
  fi
}

if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

if command -v task &> /dev/null; then
  eval "$(task --completion bash)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi
