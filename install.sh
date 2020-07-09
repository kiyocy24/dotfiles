#!/bin/sh
echo 'Hello! from dotfiles/install.sh'
cd ~


#--------------------------------------------------------------#
##        Clean setting files                                 ##
#--------------------------------------------------------------#
echo 'start: Clean setting files'
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -f ~/.zprofile ] && rm ~/.zprofile

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

echo 'Installing tig'
brew install tig

echo 'Installing lazygit'
brew install lazygit

echo 'start: git clone dotfiles'
git clone --recursive https://github.com/kiyocy24/dotfiles.git ~/dotfiles
echo 'complete: git clone dotfiles'

echo 'start: set sybolic link'
ln -sf ~/dotfiles/.zprezto/runcoms/zlogin ~/.zlogin
ln -sf ~/dotfiles/.zprezto/runcoms/zlogout ~/.zlogout
ln -sf ~/dotfiles/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -sf ~/doftiles/.zprezto/runcoms/zshenv ~/.zshenv
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

echo 'start: apply .zshrc'
source ~/dotfiles/.zshrc

echo 'completed!'
