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

#~/.scripts/touchpad.sh

# Set the cursor
xsetroot -cursor_name left_ptr

# Set urxvt preferences
xrdb -merge .Xresources

# Tool for hiding pointer
unclutter -grab -noevents -root &

# Set the wallpaper
feh --bg-scale ~/Pictures/hollywoo.jpg

# Swap super and ctrl
xmodmap ~/.Xmodmap

sxhkd &
#compton &
exec bspwm
#exec cinnamon-session
#exec mate-session
#exec gnome-session
