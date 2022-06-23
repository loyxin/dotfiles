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

ln -s ~/bin/conf/alacritty.yml ~/.config/alacritty.yml
ln -s ~/bin/conf/compton.conf ~/.config/compton.conf
ln -s ~/bin/conf/neofetch ~/.config/neofetch
ln -s ~/bin/conf/ranger ~/.config/ranger
ln -s ~/bin/conf/polybar ~/.config/polybar
ln -s ~/bin/conf/i3 ~/.config/i3
ln -s ~/bin/conf/background ~/.config/.background
ln -s ~/bin/conf/conkyrc ~/.conkyrc

fi

