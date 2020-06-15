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
git clone https://github.com/kiyocy24/dotfiles.git ~/dotfiles
echo 'complete: git clone dotfiles'

echo 'start: setup symbolic links'
ln -s ~/dotfiles/shells/.zprofile ~/.zprofile
ln -s ~/dotfiles/dein ~/dein
