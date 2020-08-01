if [[ -s "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt pure

alias ls='ls -FG'
alias ll='ls -alFG'
alias vi='nvim'
alias vim='nvim'
alias t='tmux'

alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gst='git status'
alias gd='git diff'
alias gf='git fetch'

unsetopt correct

function move_to_repository() {
   cd $(ghq list -p --vcs=git | fzf --reverse)
   zle reset-prompt
}
zle -N move_to_repository
bindkey '^q' move_to_repository

export GOENV_ROOT="${HOME}/.goenv"
export PATH="${GOENV_ROOT}/bin:$PATH"
eval "$(goenv init -)"

eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiyoshi.kanazawa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kiyoshi.kanazawa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiyoshi.kanazawa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kiyoshi.kanazawa/google-cloud-sdk/completion.zsh.inc'; fi
