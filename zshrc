. "$HOME/.cargo/env"
export PATH="/Users/egormarin/.pixi/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bun completions
[ -s "/Users/egormarin/.bun/_bun" ] && source "/Users/egormarin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


bindkey "[C" forward-word
bindkey "[D" backward-word
bindkey \^U backward-kill-line

# alias vi='nvim'
# alias vim='nvim'
# alias ls='exa'
# alias ll='exa -lah --sort=modified --icons --git'
# alias l='exa -l --group-directories-first'
# alias htop='btm --theme nord-light'
alias myupdate='cargo install cargo-update && cargo install-update -a && omz update -y && rustup update'

alias vnot="deactivate"
alias mkv="uv venv"
alias vrun="source .venv/bin/activate"
