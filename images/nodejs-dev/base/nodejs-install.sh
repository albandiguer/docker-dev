#!/usr/bin/env bash

set -ex

nodenv install "$1"
nodenv global "$1"
