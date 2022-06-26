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

ln -s ~/.config/loyconf/neofetch ~/.config/neofetch
ln -s ~/.config/loyconf/ranger ~/.config/ranger
ln -s ~/.config/loyconf/polybar ~/.config/polybar
ln -s ~/.config/loyconf/i3 ~/.config/i3
ln -s ~/.config/loyconf/background ~/.config/.background

echo "need passwd"
sudo ln ~/.config/loyconf/sddm.conf /etc/sddm.conf
echo "install sddm theme"
sudo pacman -S gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia
git clone https://github.com/3ximus/aerial-sddm-theme.git
sudo mv aerial-sddm-theme /usr/share/sddm/themes/aerial

fi

