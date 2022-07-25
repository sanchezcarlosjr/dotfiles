#!/usr/bin/env bash
set -e
cd $HOME/.local/share/nvim/site/pack
while read p; do
	result=$(echo $p | sed 's/.*\/\(.*\)\.git/\1\/start\/\1/' )
	git clone $p $result | true
done <$DOTFILES_PATH/editors/vim/plugins
