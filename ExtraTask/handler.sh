#!/bin/bash

read -a array < /dev/shm/array.shared

echo "${#array[@]}";

(tail -f channel) |
while true; do
	read -d " " first;
	echo "first is $first";
	if [[ $first == "QUIT" ]]; then
		killall tail
		exit 0
	else
		read second;
		echo "second is $second  array size is ${#array[@]} "
		if [ "$second" -gt "$first" ] && [ "${#array[@]}" -ge "$second" ]; then
			sum=0
			echo "${#array[@]}"
			echo "${#array[1]}"
			for (( i=first; i<second; i++ )) do
				sum=$((sum + array[i]))
			done
			echo "sum in [$first, $second] = $sum"
		else
			echo "handler: incorrect input"
		fi
	fi
done
