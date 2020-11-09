#!/bin/bash

mode="add"
count=1

(tail -f channel) |
while true; do
	read line;
	if [[ $line == "QUIT" ]]; then
		killall tail
		exit 0
	elif [[ $line == "+" ]]; then
		mode="add"
	elif [[ $line == "*" ]]; then
		mode="multiply"
	else
		case $mode in
			"add" ) count=$((count + line));;
			"multiply" ) count=$((count * line));;
		esac;
		echo "new cont $count"
	fi
done
