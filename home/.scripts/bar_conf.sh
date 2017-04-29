#!/bin/bash

Clock() {
	DATE=$(date "+%a %b %d, %T")
	echo -n "%{F#FFF}$DATE"
}

Battery() {
	#BATPERC=$(acpi --battery | cut -d, -f2)
	BATPERC=$(~/.scripts/battery.sh)
	echo "$BATPERC"
}

Network() {
	echo $(~/.scripts/net.sh)
}

Volume() {
	echo $(~/.scripts/vol.sh)
}

while true; do
	echo "%{l} $(Network)%{c} $(Clock) %{r}$(Volume) %{F#FFF}| $(Battery) "
	sleep 1;
done
