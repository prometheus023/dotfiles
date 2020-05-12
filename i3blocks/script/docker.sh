#!/bin/bash

DOCKER=$(systemctl is-active docker)

if [ ${DOCKER} == "active" ];
    then
    echo "";
    echo "";
else
    echo "";
    echo "";
    echo "white";
fi;

exit 0
