setopt interactivecomments
bindkey -e

. "$HOME/.cargo/env"
source $HOME/.local/bin/env  # uv
export PATH="/Users/egormarin/.pixi/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
alias t='task'

if command -v direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

if command -v task &> /dev/null; then
  eval "$(task --completion zsh)"
fi

if command -v zoxide &> /dev/null; then
  cd() {
    if [ -n "$1" ]; then
      z "$@" && ll --group-directories-first
    else
      z ~ && ll --group-directories-first
    fi
  }
  eval "$(zoxide init zsh)"
fi

function proxy() {
	# hosts=(bastion digitalocean)
	hosts=(vdsina-moscow)
	port=12000
	for host in $hosts; do
		echo "  Creating tunnel to ${host}..."
		autossh -M 0 -f -N -D ${port} ${host}
		echo "  connected to ${host}, port ${port}"
		port=$((port+1))
	done
}

function unproxy() {
	mask='autossh -M 0 -f -N -D'
	echo "Found $(pgrep -af ${mask} | wc -l) tunnels"
	echo "Killing those ssh tunnels..."
	pkill -f ${mask} && echo "Done"
}

function reproxy() {
	unproxy; proxy
}
