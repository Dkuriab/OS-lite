#!/bin/bash

array=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)

printf "%s " "${array[@]}" > /dev/shm/array.shared

REGEXP="^[0-9]+[[:space:]][0-9]+$"
./handler.sh &
mkfifo channel || true

while true
do
	read line;
	[ -z "$line" ] && continue

	if [[ $line == "QUIT" ]]; then
		rm -f /dev/shm/array.shared
		exit 0;
	fi;
	if ! [[ $line =~ $REGEXP ]]; then
		echo "incorrect input for string |$line|";
		rm -f /dev/shm/array.shared
		exit 1;
	fi;
	echo "$line" > channel
done

