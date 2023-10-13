#!/bin/zsh
echo 'Hello! from dotfiles/install.sh'

defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 10

echo "Install HomeBrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'Updating HomeBrew'
brew update
brew doctor

echo 'Installing zsh'
brew install zsh
brew install zsh-completion

echo 'Installing git'
brew install git

echo 'Installing tig'
brew install tig

echo 'Installing tmux'
brew install tmux

echo 'Install neovim'
brew install neovim

echo 'Installing ghq'
brew install ghq

echo 'Installing fzf'
brew install fzf

echo 'Installing direnv'
brew install direnv 

echo "Installing tfenv"
brew install tfenv

echo "Installing zplug"
brew install zplug

echo "Installing VOLTA"
curl https://get.volta.sh | bash

echo 'Installing alfred'
brew install --cask alfred

echo "Installing Visual Studio Code"
brew install --cask visual-studio-code

echo "Installing Docker"
brew install --cask docker

echo "Installing Typora"
brew install --cask typora

echo "Installing dein"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"

echo 'Setup default shell'
chsh -s /bin/zsh

echo 'Starting clean setting files'
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.bash_profile ] && rm ~/.bash_profile
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -f ~/.zprofile ] && rm ~/.zprofile

echo 'Downloading git clone dotfiles...'
git clone --recursive https://github.com/kiyocy24/dotfiles.git ~/dotfiles

echo 'set sybolic link'
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig-primary ~/.gitconfig-primary
ln -sf ~/dotfiles/.gitconfig-enterprise ~/.gitconfig-enterprise
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc

mkdir -p ~/.config
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/.config/karabiner ~/.config/karabiner

echo 'set ghq directory'
git config --global ghq.root $HOME/ghq

echo 'source .zshrc'
source ~/dotfiles/.zshrc

echo 'completed!'

