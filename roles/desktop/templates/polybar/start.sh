#!/bin/sh

HOST=$(hostname)
POLYBAR_PADDING=32

killall polybar

{% if ansible_hostname == "starscream" %}
export PRIMARY_MONITOR="DisplayPort-2"
export SECONDARY_MONITOR="DisplayPort-1"
{% elsif ansible_hostname == "mirage" %}
EXT_CONNECTED=$(xrandr --listmonitors | grep DP-1-2)
if [ $? -eq 0  ]
then
    export PRIMARY_MONITOR="DP-1-2"
    export SECONDARY_MONITOR="DP-2-2"
else
    export PRIMARY_MONITOR="eDP-1"
    export SECONDARY_MONITOR=""
fi
{% else %}
export PRIMARY_MONITOR="VGA-1"
export SECONDARY_MONITOR=""
{% endif %}


if [ ! -z "$PRIMARY_MONITOR" ]
then
    PRIMARY_TOTAL_WIDTH="$(xrandr | grep -w connected | grep $PRIMARY_MONITOR | sed 's/primary //' | awk -F'[ +]' '{print $3}' | awk -F'x' '{print $1}')"
    export PRIMARY_MONITOR_WIDTH=$(($PRIMARY_TOTAL_WIDTH-$POLYBAR_PADDING))
fi

if [ ! -z "$SECONDARY_MONITOR" ]
then
    SECONDARY_TOTAL_WIDTH="$(xrandr | grep -w connected | grep $SECONDARY_MONITOR | sed 's/primary //' | awk -F'[ +]' '{print $3}' | awk -F'x' '{print $1}')"
    export SECONDARY_MONITOR_WIDTH=$(($SECONDARY_TOTAL_WIDTH-$POLYBAR_PADDING))
fi

echo "primary=$PRIMARY_MONITOR"
echo "primary width='$PRIMARY_MONITOR_WIDTH'"
echo "secondary=$SECONDARY_MONITOR"
echo "secondary width='$SECONDARY_MONITOR_WIDTH'"

if [ ! -z "$PRIMARY_MONITOR" ]
then
	echo "Launching primary polybar on monitor $PRIMARY_MONITOR"
	polybar primary &
fi

if [ ! -z "$SECONDARY_MONITOR" ]
then
	echo "Launching secondary polybar on monitor $SECONDARY_MONITOR"
	polybar secondary &
fi
