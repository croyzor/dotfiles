#!/bin/bash

Clock() {
	DATE=$(date "+%a %b %d, %T")
	echo -n "$DATE"
}

Battery() {
	#BATPERC=$(acpi --battery | cut -d, -f2)
	BATPERC=$(~/.scripts/battery.sh)
	echo "$BATPERC"
}

Network() {
	echo $(~/.scripts/net.sh)
}

while true; do
	echo "%{l}$(Network)%{c}%{Fwhite}%{Bblack} $(Clock)%{F-} %{r}$(Battery)"
	sleep 1;
done
