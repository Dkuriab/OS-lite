#!/bin/bash

for process in `find /proc -maxdepth 1 -mindepth 1 -name "[0-9]*" -type d`;
    do
    if test -f "${process}/status"; then
        pid=${process:6}
        ppid=`grep -s "PPid" "${process}/status" | awk '{ print $2 }'`
        sum=`grep -s "sum_exec_runtime" "${process}/sched" | awk '{ print $3 }'`
        nr=`grep -s "nr_switches" "${process}/sched" | awk '{ print $3 }'`
        awd=$(echo "scale=5; $sum / $nr" | bc)

	echo $ppid "ProcessID=${pid} : Parent_Process=${ppid} : Average_Running_Time=${awd}"
fi
done | sort -n -k1 | awk '{ $1=""; print $0 }' > task4.answer

