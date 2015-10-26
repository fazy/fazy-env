#!/bin/bash

# http://superuser.com/questions/758463/getting-1920x1080-resolution-or-169-aspect-ratio-on-ubuntu-or-linux-mint

xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 1920x1080
xrandr --output Virtual1 --mode 1920x1080

