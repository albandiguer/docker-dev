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

# Install golang (required by terraform lsp)
VERSION="1.16" # go version
ARCH="amd64" # go archicture
curl -O -L "https://golang.org/dl/go${VERSION}.linux-${ARCH}.tar.gz"
tar -xf "go${VERSION}.linux-${ARCH}.tar.gz" -C /tmp/
sudo chown -R root:root /tmp/go
sudo mv -v /tmp/go /usr/local
# set up Go lang path #
echo 'export GOPATH=$HOME/go' >> "$HOME/.zshrc"
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> "$HOME/.zshrc"

# Install terraform-lsp
curl -O -L https://github.com/juliosueiras/terraform-lsp/releases/download/v0.0.11-beta2/terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz
tar -xvf terraform-lsp_0.0.11-beta2_linux_amd64.tar.gz -C /tmp/
sudo mv /tmp/terraform-lsp /usr/local/bin/

# Install terraform
apt-install gnupg2
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-install terraform

# Install tflint
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash -

# Refresh plugin + coc
nvim +PlugInstall +CocUpdateSync +qall


# Cleanup
rm *.tar.gz
sudo apt-get clean -y
sudo rm -rf /var/lib/apt/lists/*
