#!/bin/bash

s=$(acpi -b)

if [[ $s =~ ^.*[[:blank:]](Discharging|Charging|Full)", "(.*)", "(.*):.*$ ]];
    then
        STATUS="${BASH_REMATCH[1]}";
        BAT="${BASH_REMATCH[2]}";
        PREV="${BASH_REMATCH[3]}";
fi;

ICON=;

[ ${STATUS} == ""] && echo "$ICON (100%)" && exit 0

if [ ${STATUS} == "Discharging" ] && [ ${BAT%?} -ge 1 ] && [ ${BAT%?} -le 20 ];
  then ICON=;
elif [ ${STATUS} == "Discharging" ] &&  [ ${BAT%?} -ge 21 ] && [ ${BAT%?} -le 40 ];
  then ICON=;
elif [ ${STATUS} == "Discharging" ] && [ ${BAT%?} -ge 41 ] && [ ${BAT%?} -le 60 ];
  then ICON=;
elif [ ${STATUS} == "Discharging" ] && [ ${BAT%?} -ge 61 ] && [ ${BAT%?} -le 80 ];
  then ICON=;
elif [ ${STATUS} == "Discharging" ] && [ ${BAT%?} -ge 81 ];
  then ICON=;
fi;

# Full and short texts
echo "$ICON  ${BAT} ($PREV)"
echo "$ICON  ${BAT} ($PREV)"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && [ ${STATUS} == "Discharging" ] && echo "#FF8000"
[ ${BAT%?} -ge 81 ] && [ ${STATUS} == "Charging" ] && echo "#FF8000"

exit 0
