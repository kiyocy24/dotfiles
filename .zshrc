# Source Prezto.
chmod 755 /usr/local/share/zsh/site-functions chmod 755 /usr/local/share/zsh zsh
chmod 755 /usr/local/share/zsh zsh
zsh

if [[ -s "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dotfiles/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt sorin

alias ls='ls -FG'
alias ll='ls -alFG'
alias vim='nvim'

unsetopt correct
