ARG UBUNTU_RELEASE=focal

FROM ubuntu:${UBUNTU_RELEASE}

LABEL MAINTAINER alban.diguer@gmail.com

ENV USER albandiguer
ENV HOME "/home/$USER"

ARG UBUNTU_RELEASE

ENV UBUNTU_RELEASE=${UBUNTU_RELEASE}

# TODO: user name should be customisable?
RUN apt-get update && \
	apt-get install sudo -y && \
	adduser --disabled-password --gecos '' $USER && \
	adduser $USER sudo && \
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# {{{ lang stuff

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
RUN apt-get update && \
	apt-get install -y language-pack-en-base && \
	rm -rf /var/lib/apt/lists/*

# }}}

# Required for `clear` command to work, etc.
ENV TERM screen-256color

ENV DOCKER_CLI_SHA256 "0a52d21eace395e6077b4c99b8ff96ffb9203ba6be1bdffcfb716bea645f5745"
ENV DOCKER_CLI_VERSION "19.03.5"
ENV DOCKER_HOST "/var/run/docker.sock"

ENV ZSH "$HOME/.oh-my-zsh"

COPY build.sh /tmp/build.sh

RUN bash /tmp/build.sh && \
	rm /tmp/build.sh

WORKDIR $HOME

COPY ./inputrc "$HOME/.inputrc"
RUN sudo chown "$USER":"$USER" "$HOME/.inputrc"

COPY ./zshrc "$HOME/.zshrc"
RUN sudo chown "$USER":"$USER" "$HOME/.zshrc"

COPY ./gitconfig "$HOME/.gitconfig"
RUN sudo chown "$USER":"$USER" "$HOME/.gitconfig"

COPY ./gitignore "$HOME/.gitignore"
RUN sudo chown "$USER":"$USER" "$HOME/.gitignore"

# Remove bash files
RUN rm "$HOME/.bashrc"
RUN rm "$HOME/.profile"
RUN rm "$HOME/.bash_logout"

CMD ["/usr/bin/zsh"]
