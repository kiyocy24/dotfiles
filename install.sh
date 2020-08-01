#!/bin/zsh
echo 'Hello! from dotfiles/install.sh'

defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 10

echo 'Installing Xcode'
xcode-select-install

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

echo 'Installing lazygit'
brew install lazygit

echo 'Installing tmux'
brew install tmux

echo 'Installing ghq'
brew install ghq

echo 'Installing fzf'
brew install fzf

echo 'Installing yarn'
brew install yarn

echo 'Installing direnv'
brew install direnv 

echo 'Installing alfred'
brew cask install alfred

echo "Installing Google Japanese IME"
brew cask install google-japanese-ime

echo "Installing Visual Studio Code"
brew cask install visual-studio-code

echo "Installing Docker"
brew cask install docker

echo "Installing Typora"
brew cask install typora

echo 'Installing nvim'
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

echo 'Setup default shell'
chsh -s /usr/local/bin/zsh

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
ln -sf ~/dotfiles/.gitconfig-kiyocy ~/.gitconfig-kiyocy
ln -sf ~/dotfiles/.gitconfig-enterprise ~/.gitconfig-enterprise
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

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

