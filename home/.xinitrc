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

# Set uk keyboard for X apps
setxkbmap -layout gb

# Custom touchpad config using synaptic
~/.scripts/synclient.sh

# Set the cursor
xsetroot -cursor_name left_ptr

# Set urxvt preferences
xrdb -merge .Xresources

# Tool for hiding pointer
unclutter -grab -noevents -root &

# Set the wallpaper
feh --bg-scale ~/pics/sombra.jpg

# Swap super and ctrl
xmodmap ~/.Xmodmap &

sxhkd &
# Bar
~/.scripts/bar_run.sh &

# Brightness
xbacklight -set 15 &

# Redshift
#redshift -l 55.8642:-4.2518

#compton &
exec bspwm
#exec cinnamon-session
#exec mate-session
#exec gnome-session
