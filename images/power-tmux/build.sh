#!/usr/bin/env zsh

# Print out every line being run
set -x

# If a command fails, exit immediately.
set -e

apt-install() {
	sudo apt-get install --no-install-recommends -y "$@"
}

install-tmux() {
	pushd /tmp
	local tmux_src="/tmp/tmux"
	git clone --branch "$TMUX_VERSION" --depth 1 https://github.com/tmux/tmux.git "$tmux_src"
	pushd "$tmux_src"
	local libevent="libevent-2.1.6" libevent_dev="libevent-dev"
	if [ "$UBUNTU_RELEASE" = "focal" ]; then
		libevent="libevent-2.1-7"
		libevent_dev="libevent-dev"
	fi
	# libevent is a run-time requirement. *-dev are for the header files.
	apt-install "$libevent_dev" "$libevent" libncurses-dev autoconf automake pkg-config bison
	sh autogen.sh
	./configure
	make
	sudo make install
	popd
	rm -rf "$tmux_src"
	sudo apt-get purge -y libevent-dev libncurses-dev autoconf automake pkg-config bison
	popd
}

install-tmux-plugin-manager() {
  git clone https://github.com/tmux-plugins/tpm /home/albandiguer/.tmux/plugins/tpm
  /home/albandiguer/.tmux/plugins/tpm/scripts/install_plugins.sh
}

sudo apt-get update

# Fix file permissions from the copy
sudo chown -R albandiguer:albandiguer "$HOME/.config"
sudo chown albandiguer:albandiguer /home/albandiguer/.config/tmux/tmux.conf

# Need to update package cache...
sudo apt-get update

# Tmux
install-tmux
install-tmux-plugin-manager

# Add fzf fuzzy finder
git clone https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-bash --no-fish

# Cleanup cache
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get autoremove -y
