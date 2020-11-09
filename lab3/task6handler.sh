#!/bin/bash
echo $$ > .pid
count=1

add() {
	count=$((count + 2))
	echo $count
}

mul() {
	count=$((count * 2))
	echo $count
}

term() {
	echo "terminated by generator"
	rm .pid
	exit 0
}

trap add USR1
trap mul USR2
trap term SIGTERM

while true;
do
	sleep 1s
done
