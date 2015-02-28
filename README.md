# dotfiles

My humble collection of dotfiles. Probably not of much use to anyone else.

The `linker` script creates symbolic links from these files to the places they belong.

### Tmux
My tmux config is almost completely *borrowed* from dcat's [blog post](http://calummacrae.blogspot.co.uk/2012/12/dropping-status-bars-for-tmux-as-im.html) on a barless config.

Relevant files:
* `tmux.conf`
* `battery.sh`
* `net.sh`
The only real difference being that my `net.sh` file uses `netctl list` rather than `iwgetid`

### bspwm
My bspwmrc is copied from the example files, the sxhkdrc is copied from the example with the addition of Chromebook (C720) keysbindings. 
The other night, I tried to annotate my sxhkdrc, but there are a couple of bspc bindings from the example config which I don't understand yet.

Relevant files:
* `bspwmrc`
* `sxhkdrc`

### X stuff
xinitrc to launch sxhkd, bspwm and set the keyboard and touchpad the way I like.

Relevant files:
* `xinitrc`
* `Xresources`
* `touchpad.sh`

### I would be lost without these
* `vimrc`
* `zshrc`

### Misc
* `ghci` - Only changes the prompt
* `vimperatorrc` - Adds a couple of remappings
