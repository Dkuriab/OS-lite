#!/bin/bash

before=()
after=()
for process in `find /proc -maxdepth 1 -mindepth 1 -name "[0-9]*" -type d`;
    do
    if test -f "${process}/io"; then
        pid=${process:6}
        read_before=`grep "read_bytes" "${process}/io" | awk '{ print $2 }'`
        before[$pid]=$read_before
    fi
done

sleep 15s

for process in `find /proc -maxdepth 1 -mindepth 1 -name "[0-9]*" -type d`;
    do
    if test -f "${process}/io"; then
        pid=${process:6}
        read_after=`grep "read_bytes" "${process}/io" | awk '{ print $2 }'`
        after[$pid]=$read_after
    fi
done

for process in ${!after[*]}
do
    com=`ps aux | grep $process | head -n 1 | awk '{ print $11 }'`
    count=$(echo "${after[$process]-${before[$process]}}" | bc)
    echo $process " : " $count " : " $com
done | sort -n -k3 | tail -n 3


