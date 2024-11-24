#!/usr/bin/env bash
# echo $1
jq --arg timestamp $1 \
    --argjson speed 13 \
   --arg hardBraking "Off" \
   --argjson lateralAcceleration -8.0 \
    --argjson speedDifference -2.0 \
    --argjson distance 8.0 \
    '
    .EBW.timestamp=$timestamp |
    .EBW.RV.motion.speed=$speed |
    .EBW.RV.electronics.hardBraking=$hardBraking |
    .EBW.RV.motion.lateralAcceleration=$lateralAcceleration |
    .EBW.relation.data.speedDifference=$speedDifference |
    .EBW.relation.data.distance=$distance
    ' \
    ebw_mockdata.json
