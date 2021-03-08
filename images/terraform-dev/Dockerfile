ARG BASE_TAG=latest

FROM albandiguer/nvim:$BASE_TAG

USER albandiguer

ENV IMAGE_CLASS terraform

COPY ./plugin.vim /tmp/plugin.vim
COPY ./post-plugin.vim /tmp/post-plugin.vim

COPY ./build.sh /tmp/build.sh
RUN /tmp/build.sh && sudo rm /tmp/build.sh
