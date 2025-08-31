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


# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

function z() {
    __zoxide_z "$@"
}

function zi() {
    __zoxide_zi "$@"
}

# Completions.
if [[ -o zle ]]; then
    __zoxide_result=''

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            # Show completions for local directories.
            _cd -/

        elif [[ "${words[-1]}" == '' ]]; then
            # Show completions for Space-Tab.
            # shellcheck disable=SC2086
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]})" || __zoxide_result=''

            # Set a result to ensure completion doesn't re-run
            compadd -Q ""

            # Bind '\e[0n' to helper function.
            \builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
            # Sends query device status code, which results in a '\e[0n' being sent to console input.
            \builtin printf '\e[5n'

            # Report that the completion was successful, so that we don't fall back
            # to another completion function.
            return 0
        fi
    }

    function __zoxide_z_complete_helper() {
        if [[ -n "${__zoxide_result}" ]]; then
            # shellcheck disable=SC2034,SC2296
            BUFFER="z ${(q-)__zoxide_result}"
            __zoxide_result=''
            \builtin zle reset-prompt
            \builtin zle accept-line
        else
            \builtin zle reset-prompt
        fi
    }
    \builtin zle -N __zoxide_z_complete_helper

    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete z
fi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"

cd() {
  if [ -n "$1" ]; then
    z "$@" && ll --group-directories-first
  else
    z ~ && ll --group-directories-first
  fi
}

eval "$(task --completion zsh)"
eval $(starship init zsh)
