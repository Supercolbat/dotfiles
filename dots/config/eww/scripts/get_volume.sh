#!/bin/sh
echo -n $(pulsemixer --get-volume | awk '{print $1}')
