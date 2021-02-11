#!/usr/bin/env zsh

set -ex

# NODENV_ROOT=/home/albandiguer/.nodenv
# TODO mad ugly
/home/albandiguer/.nodenv/bin/nodenv install "$1"
/home/albandiguer/.nodenv/bin/nodenv global "$1"
