#!/usr/bin/env bash

set -ex


HOME="/home/albandiguer"

for file in plugin post-plugin; do
	cat "/tmp/$file.vim" >> "$HOME/.config/nvim/$file.vim"
	sudo rm "/tmp/$file.vim"
done

NODENV_ROOT="$HOME/.nodenv"

# check code from github
git clone https://github.com/nodenv/nodenv.git $NODENV_ROOT
git clone https://github.com/nodenv/node-build.git "$NODENV_ROOT"/plugins/node-build

# compile dynamic bash extension
cd $NODENV_ROOT && src/configure && make -C src

# for ubuntu
echo 'export PATH="$NODENV_ROOT/bin:$PATH"' >> "$HOME/.zshrc"

# Add nodenv init to your shell to enable shims and autocompletion.
echo 'eval "$(nodenv init -)"' >> "$HOME/.zshrc"

# Cleanup whats left...
sudo apt-get autoremove -y
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

# Install vim plugins
nvim +PlugInstall +qall
