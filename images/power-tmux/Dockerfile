ARG BASE_TAG=latest

FROM albandiguer/ubuntu-dev-base:$BASE_TAG

USER albandiguer

ENV XDG_CONFIG_HOME "$HOME/.config"

COPY ./tmux.conf "$HOME/.config/tmux/tmux.conf"

ENV TMUX_VERSION 3.1
ENV TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/"

COPY ./build.sh /tmp/build.sh

RUN bash /tmp/build.sh && \
	sudo rm /tmp/build.sh

CMD ["/usr/local/bin/tmux", "new"]
