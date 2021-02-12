#!/usr/bin/env zsh

set -ex


HOME="/home/albandiguer"

for file in plugin post-plugin; do
	cat "/tmp/$file.vim" >> "$HOME/.config/nvim/$file.vim"
	sudo rm "/tmp/$file.vim"
done

# Install vim plugins
nvim +PlugInstall +qall

# Install coc extensions
# https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
nvim +'CocInstall -sync coc-json coc-tsserver coc-html|q' +qall
# https://github.com/neoclide/coc.nvim/issues/450#issuecomment-632482922
nvim +CocUpdateSync +qall

# Add local deps binaries to path
echo 'export PATH=./node_modules/.bin:$PATH' >> "$HOME/.zshrc"
