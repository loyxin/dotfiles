#!/bin/bash
#########################################################################
# File Name: program/back/etc/home/i3/dmenu.sh
# Author: loyxin
# mail: loyxin@gmail.com
# Created Time: 2019-10-08 19:32:57
#########################################################################

exe=`dmenu_path | ~/.local/bin/yeganesh -- -i -sf white -sb orange -nb black -nf "#0cf"` && eval "exec $exe"

