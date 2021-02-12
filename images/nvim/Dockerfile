ARG BASE_TAG=latest

FROM albandiguer/power-tmux:$BASE_TAG

USER albandiguer

COPY ./build.sh /tmp/build.sh

COPY ./bashrc-additions.sh /tmp/bashrc-additions.sh

COPY init.vim "$HOME/.config/nvim/init.vim"
COPY plugin.vim "$HOME/.config/nvim/plugin.vim"
COPY post-plugin.vim "$HOME/.config/nvim/post-plugin.vim"
COPY ./.editorconfig "$HOME/.editorconfig"

COPY ./ackrc "$HOME/.ackrc"
RUN sudo chown "$USER":"$USER" "$HOME/.ackrc"

RUN /tmp/build.sh && \
	sudo rm /tmp/build.sh
