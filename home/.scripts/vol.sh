#!/bin/bash

DATA=$(amixer sget Master | grep % | sed 's/\]//g')

MUTE_STATUS=$(echo $DATA | cut -d '[' -f4)
VOL=$(echo $DATA | cut -d '[' -f2)

if [[ $MUTE_STATUS = 'on' ]]
then
	COLOUR="F#6FF"
else
	COLOUR="F#F00"
fi

echo "%{$COLOUR}$VOL"
