#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

feh --bg-scale ~/Pictures/sands.jpg
~/.scripts/touchpad.sh
setxkblayout gb
xsetroot -cursor_name left_ptr
xrdb -merge .Xresources
unclutter -grab -noevents -root &
sxhkd &
#compton &
exec bspwm
#exec cinnamon-session
#exec mate-session
#exec gnome-session
