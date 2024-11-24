#!/usr/bin/env bash

template='{"timestamp": %s, "speed": %s, "accelerate": %s, "severity": %s }'

# Variable to store your rendered template JSON string
data=""

# Some variables to substitute into the template
APPNAME=V2X_UC
TIMESTAMP=123456
SPEED_BASE=70
ACC=0.5
SERVILITY=1
Delt_SPD=0
Delt_DIS=20

for (( i=0; i<1000; i++ ));
do
# var=$((var+1))
TIMESTAMP=$(date +%s%3N)

ACC=$(($RANDOM%2)).$(($RANDOM%100))
SPEED=$(( ( RANDOM % 10 )  + ${SPEED_BASE} ))

SERVILITY=$(((i %3)+1))

sleep 0.3
# Render the template, substituting the variable values and save the result into $data
# printf -v data "$template" "$TIMESTAMP" "$SPEED" "$ACC" "$SERVILITY"
# Print it out
# echo "$data"
./ebw.sh $TIMESTAMP | mosquitto_pub -h localhost -t "v2x-platform/eebl-topic" -s

# mosquitto_pub -h localhost -t "v2x-platform/eebl-topic" -m "$data"
done
