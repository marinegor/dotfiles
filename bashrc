. "$HOME/.cargo/env"
export PATH="/Users/egormarin/.pixi/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
