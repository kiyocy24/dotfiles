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
 bindkey '^g' move_to_repository
