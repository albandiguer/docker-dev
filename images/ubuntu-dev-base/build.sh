#!/usr/bin/env bash

# If one command exits with an error, stop the script immediately.
set -eo pipefail

# Print every line executed to the terminal.
set -x

apt-install() {
	apt-get install --no-install-recommends -y "$@"
}

apt-get update

if [ "$UBUNTU_RELEASE" = "focal" ]; then
	# fixes issue in newer releases:
	# https://github.com/sudo-project/sudo/issues/42#issuecomment-609079906
	echo "Set disable_coredump false" >> /etc/sudo.conf
fi

yes | unminimize || true

# Super essential tools
apt-install tree curl

# Going to need this a lot
apt-install python3-pip

pip3 install setuptools

# See readme for how to get the clipboard working.
apt-install xclip

# Man pages on base debian image aren't installed...
apt-install man-db

# Shorter man pages
apt-install tldr

# For dig, etc. On ubuntu focal, tzdata is also getting installed, so gotta
# work around that.
export DEBIAN_FRONTEND=noninteractive
echo 'Etc/UTC' | sudo tee /etc/timezone
apt-install dnsutils

# ssh
apt-install openssh-client

# pager better than less...
apt-install less

# used all the time
apt-install -y zip unzip

# magically detects file type without extension
apt-install file

# Expose local servers to the internet. Useful for testing webhooks, oauth,
# etc.
curl -o /tmp/ngrok.zip \
	https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
sudo unzip /tmp/ngrok.zip -d /usr/local/bin
rm /tmp/ngrok.zip

# Install latest git
apt-install git

# Required for so many languages this will simply be included by default.
apt-install build-essential pkgconf

# Alias for tree view of commit history.
git config --system alias.tree "log --all --graph --decorate=short --color --format=format:'%C(bold blue)%h%C(reset) %C(auto)%d%C(reset)\n         %C(blink yellow)[%cr]%C(reset)  %x09%C(white)%an: %s %C(reset)'"

# zsh
apt-install zsh
# set ZSH as the default login shell for the user you’re logged in
sudo usermod -s /usr/bin/zsh albandiguer
# add https://github.com/ohmyzsh/ohmyzsh, this install in /root/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# add docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# cache is useless to keep
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
