#!/bin/bash
handler=$(cat .pid)

while true;
do
	read line;
	case $line in
		"+" )
			kill -USR1 $handler;;
		"*" )
			kill -USR2 $handler;;
		"TERM" )
			kill -SIGTERM $handler
			exit 0;;
	esac
done
