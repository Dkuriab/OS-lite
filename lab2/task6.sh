#!/bin/bash

max_pid=0
max_rrs=0

for process in `find /proc -maxdepth 1 -mindepth 1 -name "[0-9]*" -type d`;
    do
    if test -f "${process}/status"; then
        pid=${process:6}
        rrs=`cat "${process}/statm" | awk '{ print $2 }'`
        if [[ "$rrs" -gt "$max_rrs" ]]; then
            max_pid=$pid
            max_rrs=$rrs
        fi
    fi
done

size=$(echo "$(getconf PAGESIZE)*$max_rrs/1024" | bc)
echo "max by self scan $max_pid : $size Kbytes"
top -o %MEM -d 1 -b | head -n 8 | tail -n 1 | awk '{ print "max by top " $1 " : " $6 " Kbytes" }'

