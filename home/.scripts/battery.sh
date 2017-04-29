#echo "♥" $(acpi | cut -d ',' -f '2' | sed 's/%//')
#echo "♥" $(acpi | cut -d ',' -f '2')
PERC=$(acpi | cut -d ',' -f '2' | sed 's/%//') # Battery Percentage
STAT=$(acpi | cut -d ' ' -f3 | sed 's/,//')    # Charging Status
if [ $STAT = 'Charging' ]
then
	COLOUR='%{F#6FF}Charging:'
elif [[ 20 -gt $PERC ]]
then
	COLOUR='%{F#F00}'
elif [ 50 -gt $PERC ]
then
	COLOUR='%{F#FF0}'
else
	COLOUR='%{F#0F0}'
fi
#echo "\u2665$COLOUR$PERC%"
echo "$COLOUR♥$PERC%"
