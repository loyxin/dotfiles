#!/bin/bash
#########################################################################
# File Name: launch.sh
# Author: loyxin
# mail: loyxin@gmail.com
# Created Time: 2019-09-06 20:30:41
#########################################################################

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar bar1 &

echo "Bars launched..."
