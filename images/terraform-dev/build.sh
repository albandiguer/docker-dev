#!/usr/bin/env zsh

set -ex

HOME="/home/albandiguer"

sudo apt-get update
sudo apt-get install -y --no-install-recommends software-properties-common

apt-install () {
	sudo apt-get install -y --no-install-recommends "$@"
}


for file in plugin post-plugin; do
	cat "/tmp/$file.vim" >> "$HOME/.config/nvim/$file.vim"
	sudo rm "/tmp/$file.vim"
done

nvim +PlugInstall +qall

# Install terraform
apt-install gnupg2
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-install terraform


# Install tflint
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash -


# Cleanup
sudo apt-get clean -y
sudo rm -rf /var/lib/apt/lists/*
