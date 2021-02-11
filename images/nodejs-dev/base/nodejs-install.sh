#!/usr/bin/env bash

set -ex

NODENV_ROOT=/home/albandiguer/.nodenv
nodenv install "$1"
nodenv global "$1"
