#!/bin/bash

MAX_WKSP=10

workspaces() {
	buffer=""

	# Assumes workspaces are 1, 2, 3, ..., MAX_WKSP
	for i in $(seq 1 $MAX_WKSP); do
		if [[ $(bspc query -D -d focused --names | grep -x $i) ]]; then
			buffer+="(button :onclick \"bspc desktop -f $i\" \"◆\")"
		elif [[ $(bspc query -D -d .occupied --names | grep -x $i) ]]; then
			buffer+="(button :onclick \"bspc desktop -f $i\" \"◈\")"
		else
			buffer+="(button :onclick \"bspc desktop -f $i\" \"◇\")"
		fi
	done
	echo -n "$buffer"
	buffer=""
}

# First time call
echo "(box :class \"workspace\" :orientation \"v\" :halign \"center\" :valign \"start\" :space-evenly \"false\" :spacing \"-5\" $(workspaces) )"

# Subscribe to event
bspc subscribe desktop node_transfer | while read -r _ ; do
echo "(box :class \"workspace\" :orientation \"v\" :halign \"center\" :valign \"start\" :space-evenly \"false\" :spacing \"-5\" $(workspaces) )"
done
