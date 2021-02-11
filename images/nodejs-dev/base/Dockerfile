# vim: set ft=dockerfile

ARG BASE_TAG=latest

FROM albandiguer/nvim:$BASE_TAG

USER albandiguer

ENV IMAGE_CLASS node-js

COPY ./bashrc-additions.sh /tmp/bashrc-additions.sh

COPY ./plugin.vim /tmp/plugin.vim

COPY ./post-pluggin.vim /tmp/post-plugin.vim

COPY ./build.sh /tmp/build.sh

# COPY ./repl /usr/local/bin/repl

RUN /tmp/build.sh && sudo rm /tmp/build.sh

COPY ./nodejs-install.sh /usr/local/bin/nodejs-install.sh

RUN mkdir -p $HOME/.npm
VOLUME $HOME/.npm

# COPY ./pre-commit $HOME/.config/git/hooks/pre-commit
# RUN sudo chown $USER:$USER $HOME/.config/git/hooks/pre-commit
