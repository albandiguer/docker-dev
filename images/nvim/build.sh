#!/usr/bin/env zsh

set -ex

sudo apt-get update

apt-install () {
	sudo apt-get install -y --no-install-recommends "$@"
}

apt-install software-properties-common -y

# Fix the permissions from the copy...
sudo chown -R "$USER:$USER" "$HOME/.config/nvim"

sudo chown "$USER:$USER" "$HOME/.editorconfig"

# Install neovim
apt-install neovim -y

# Python 3 api required for denite.vim
apt-install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install setuptools
sudo pip3 install neovim

# Add environment variables and `vim` alias.
cat /tmp/bashrc-additions.sh >> "$HOME/.zshrc"
sudo rm /tmp/bashrc-additions.sh

# Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install all plugins.
nvim +PlugInstall +qall

# Install ctags for code jump
apt-install exuberant-ctags

# Install editorconfig cli needed for vim plugin
apt-install editorconfig

# Install the silver searcher
apt-install silversearcher-ag

# Bye ugly vim themes
sudo mv /usr/share/nvim/runtime/colors /usr/share/nvim/runtime/colors.bkp
# Cleanups
sudo apt-get purge software-properties-common -y
sudo apt-get autoremove -y
sudo apt-get clean
rm -rf ~/.cabal
sudo rm -rf /var/lib/apt/lists/*
