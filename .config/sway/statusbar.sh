#!/usr/bin/sh

BATTERY_MAX=$(cat /sys/class/power_supply/BAT1/energy_full)
BATTERY_VALUE=$(cat /sys/class/power_supply/BAT1/energy_now)
BATTERY_PERC=$(( "$BATTERY_VALUE" * 100 / "$BATTERY_MAX" ))
BATTERY_STATUS="Battery: $BATTERY_PERC%"

# Send the header so that swaybar knows we want to use JSON
echo '{ "version": 1 }'
# Let the endless array begin
echo '['
# Sending an empty first array of blocks to make the loop simpler
echo '[]'
# Sending payload
while :;
do
	printf ",["

	printf "{"
	printf "\"name\":\"battery\",\"full_text\":\"$BATTERY_STATUS\""
	printf ",\"border\":\"#ffff00\""
	printf ",\"border_top\":3"
	printf ",\"border_bottom\":0"
	printf ",\"border_left\":0\"
	printf ",\"border_right\":0"
	printf "}"


	printf "]"


#	echo ",[{\"name\":\"time\",\"full_text\":\"$(date)\"}]"
	sleep 1
done
