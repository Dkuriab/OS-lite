#!/bin/bash

declare -a array
step=0
echo "" > report2.log

while :
do
	let 'step=step+1'
	i=0
	while [ $i -lt 10 ]
	do
		array+=($i)
		let 'i=i+1'
	done

	if [ "$(($step % 100000))" -eq "0" ]; then
		let 'len=10*step'
		echo "step &step, array more then $len" >> report2.log
	fi
done
