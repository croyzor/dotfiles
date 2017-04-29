# Arch:
#netctl list | grep \* | sed 's/\*//'

# Gentoo:
SSID=$(iwgetid | cut -d ':' -f2 | sed 's/\"//g')
echo "%{F#FFF}$SSID"
