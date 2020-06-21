alias ls='ls -FG'
alias ll='ls -alFG'
alias vim='nvim'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh"
fi

