#!/bin/bash

msgId="991049"

VOL="$(amixer -M get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
ENABLE="$(amixer -M get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
COL="#ffffff";

if [ ${VOL} -eq 0 ]
  then
  ICON=
elif [ ${VOL} -le 50 ]
  then
  ICON=;
elif [ ${VOL} -gt 50 ]
  then
  ICON=;
fi

if [ "${ENABLE}" == "on" ]
  then
  dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" "Volume: ${VOL}%"
else
  COL="#999999";
  dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted"
fi

# Full and short texts
echo "$ICON $VOL%"
echo "$ICON $VOL%"
echo "$COL"
