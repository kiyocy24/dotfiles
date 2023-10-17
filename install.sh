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

echo 'Installing git'
brew install git

echo 'Installing tig'
brew install tig

echo 'Installing tmux'
brew install tmux

echo 'Install neovim'
brew install neovim

echo 'Install starship'
brew install starship

echo "Installing aqua"
brew install aquaproj/aqua/aqua
aqua update-aqua
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
aqua -i -a

echo 'Installing alfred'
brew install --cask alfred

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
ln -sf ~/dotfiles/.config/aquaproj-aqua ~/.config/aquaproj-aqua
ln -sf ~/dotfiles/.config/starship ~/.config/starship

echo 'set ghq directory'
git config --global ghq.root $HOME/ghq

echo 'source .zshrc'
source ~/dotfiles/.zshrc

echo 'completed!'

