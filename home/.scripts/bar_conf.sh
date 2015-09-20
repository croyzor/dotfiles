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

while true; do
	echo "%{c}%{Fwhite}%{Bblack} $(Clock)%{F-} %{r}$(Battery)"
	sleep 1;
done
