#!/bin/bash

system_type=$(uname -s)

if [[ "$system_type" == "Linux" ]]; then
	mkdir -p ~/.vim/bundle/files/{backup,swap,info,undo}
	mkdir -p ~/.vim/bundle/repos
	if [[ -f ~/.vim/autoload/plug.vim ]]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
	if [[ -f ~/.zplug/init.zsh ]]; then
		git clone https://github.com/zplug/zplug ~/.zplug
	fi
	if [[ -f ~/.tmux/plugins/tpm/tpm ]]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
fi
