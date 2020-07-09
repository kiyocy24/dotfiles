if [[ -s "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt pure

alias ls='ls -FG'
alias ll='ls -alFG'
alias vim='nvim'

unsetopt correct
