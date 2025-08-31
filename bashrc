. "$HOME/.cargo/env"
export PATH="/Users/egormarin/.pixi/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# bun completions
[ -s "/Users/egormarin/.bun/_bun" ] && source "/Users/egormarin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export EDITOR=vim VISUAL=vim
export STARSHIP_CONFIG=$HOME/.config/starship.toml
eval $(starship init zsh)

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
