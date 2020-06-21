#!/bin/sh
echo 'Hello! from dotfiles/install.sh'
cd ~


#--------------------------------------------------------------#
##        Clean setting files                                 ##
#--------------------------------------------------------------#
echo 'start: Clean setting files'
[ -f ~/.zshrc ] && rm ~/.zshrc


#--------------------------------------------------------------#
##        HomeBrew install                                    ##
#--------------------------------------------------------------#
echo 'start: Install HomeBrew'
brew update
brew doctor
echo 'complete: Install Homebrew'

echo 'Installing zsh...'
brew install zsh
brew install zsh-completion

echo 'Installing git...'
brew install git

echo 'start: git clone dotfiles'
git clone --recursive https://github.com/kiyocy24/dotfiles.git ~/dotfiles
echo 'complete: git clone dotfiles'

echo 'start: apply .zshrc'
source ~/dotfiles/.zshrc

echo 'completed!'
