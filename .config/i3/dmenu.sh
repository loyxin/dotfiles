#!/bin/bash
#########################################################################
# File Name: program/back/etc/home/i3/dmenu.sh
# Author: loyxin
# mail: loyxin@gmail.com
# Created Time: 2019-10-08 19:32:57
#########################################################################
export PATH=~/.local/bin:$PATH
exec rofi -show run -theme $HOME/.config/rofi/material.rasi
