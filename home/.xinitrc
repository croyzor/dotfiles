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

feh --bg-scale ~/Downloads/hollywoo.jpg
~/.scripts/touchpad.sh
setxkblayout gb -option ctrl:swap_lwin_lctl
xsetroot -cursor_name left_ptr
xrdb -merge .Xresources
unclutter -grab -noevents -root &
sxhkd &
#compton &
#exec bspwm
#exec cinnamon-session
exec mate-session
#exec gnome-session
