export PATH="/opt/homebrew/bin:$PATH"
export EDITOR=vim

alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='nvim'
alias vim='nvim'
alias t='tmux'

alias gst='git status'
alias gca='git commit --amend'

# zsh disable auto correct
unsetopt correct

# fzf git repo search
function move_to_repository() {
   cd $(ghq list -p --vcs=git | fzf --reverse)
   zle reset-prompt
}
zle -N move_to_repository
bindkey '^q' move_to_repository

# direnv
eval "$(direnv hook zsh)"

# history search
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000        # save history num on memory
export SAVEHIST=100000        # save history num on file

setopt hist_expire_dups_first # delete oldest duplicate histories first when trimming
setopt hist_ignore_all_dups   # delete old recorded entry if new entry is a duplicate
setopt hist_ignore_dups       # ignore duplication command history list
setopt hist_save_no_dups      # do not write duplicate entries in the history file
setopt share_history          # share history between sessions

zle -N select-history         # register select-history function as zle widget
bindkey '^r' select-history   # call select-history widget with Ctrl+r

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}

# aqua
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export STARSHIP_CACHE=~$HOME/.starship/cache
