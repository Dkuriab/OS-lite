#!/bin/bash

declare -a array
step=0
len=0
N=$1

while [ $len -le $N ]
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
	fi
done
