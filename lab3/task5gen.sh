#!/bin/bash

./task5handler.sh &
mkfifo channel || true

while true
do
	read line;
	if [[ $line == "QUIT" ]]; then
		exit 0;
	fi;
	if [[ (! $line =~ ^[0-9]+$) && $line != "+" && $line != "*" ]]; then
		echo "incorrect input";
		exit 1;
	fi
	echo "$line" > channel
done

