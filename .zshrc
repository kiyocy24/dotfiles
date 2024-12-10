# homebrew
export PATH="/opt/homebrew/bin:$PATH"

# alias
alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='nvim'
alias vim='nvim'
alias t='tmux'

alias gst='git status'
alias gca='git commit --amend'

# editor
export EDITOR=vim

# zsh setting
bindkey -e
unsetopt correct
if [[ -t 0 ]]; then
  stty stop undef  # ctrl+s
  stty start undef # ctrl+q
fi
autoload -Uz compinit && compinit

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zsh plugin
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# fzf git repo search
function move_to_repository() {
  repo=$(ghq list -p --vcs=git | fzf --reverse)
  if [ -n "${repo}" ]; then
    cd "${repo}"
  fi
  zle accept-line
}
zle -N move_to_repository
bindkey '^q' move_to_repository

# aqua
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export STARSHIP_CACHE=~$HOME/.starship/cache

# direnv
eval "$(direnv hook zsh)"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

