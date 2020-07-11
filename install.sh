#!/bin/zsh
echo 'Hello! from dotfiles/install.sh'
cd ~


#--------------------------------------------------------------#
##        Clean setting files                                 ##
#--------------------------------------------------------------#
echo 'start: Clean setting files'
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -f ~/.zprofile ] && rm ~/.zprofile


#--------------------------------------------------------------#
##        Install HomeBrew and other app                      ##
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

echo 'Installing tig...'
brew install tig

echo 'Installing lazygit...'
brew install lazygit

echo 'Installing tmux...'
brew install tmux

echo 'Installing ghq...'
brew install ghq

echo 'Installing fzf...'
brew install fzf

echo 'Downloading git clone dotfiles...'
git clone --recursive https://github.com/kiyocy24/dotfiles.git ~/dotfiles

echo 'set sybolic link'
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig-kiyocy ~/.gitconfig-kiyocy
ln -sf ~/dotfiles/.gitconfig-enterprise ~/.gitconfig-enterprise

ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/.zprezto/runcoms/zlogin ~/.zlogin
ln -sf ~/dotfiles/.zprezto/runcoms/zlogout ~/.zlogout
ln -sf ~/dotfiles/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -sf ~/doftiles/.zprezto/runcoms/zshenv ~/.zshenv

echo 'set ghq directory'
git config --global ghq.root $HOME/ghq

echo 'source .zshrc'
source ~/dotfiles/.zshrc

echo 'completed!'

