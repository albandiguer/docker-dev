#!/usr/bin/env zsh

set -ex


HOME="/home/albandiguer"

for file in plugin post-plugin; do
	cat "/tmp/$file.vim" >> "$HOME/.config/nvim/$file.vim"
	sudo rm "/tmp/$file.vim"
done

# ADD NODENV
# check code from github
git clone https://github.com/nodenv/nodenv.git $NODENV_ROOT
git clone https://github.com/nodenv/node-build.git "$NODENV_ROOT"/plugins/node-build

# compile dynamic sh extension
cd $NODENV_ROOT && src/configure && make -C src

# for ubuntu
echo 'export PATH="$NODENV_ROOT/bin:$PATH"' >> "$HOME/.zshrc"

# Add nodenv init to your shell to enable shims and autocompletion.
echo 'eval "$(nodenv init -)"' >> "$HOME/.zshrc"

# Cleanup whats left...
sudo apt-get autoremove -y
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

# Install vim plugins, caveat, no node available at this stage
nvim +PlugInstall +qall


# Add local deps binaries to path
echo 'export PATH=./node_modules/.bin:$PATH' >> "$HOME/.zshrc"


# Add node-js specific ohmyzsh plugins + source again ohmyzsh
# XXX no plugins are interesting for now
# echo 'plugins+=()' >> "$HOME/.zshrc"
# echo 'source $ZSH/oh-my-zsh.sh' >> "$HOME/.zshrc"
