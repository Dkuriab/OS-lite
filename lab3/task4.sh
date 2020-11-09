#!/bin/bash

usage() {
str="$(top -b -n 1 | awk '{if ($1 == '$p1' || $1 == '$p2' || $1 == '$p3') printf("\n %s %s", $1, $9)}' | sort -n)"
echo "usage: $str"
}
nice -n 20 ./4INF1.sh &
p1=$!
./4INF2.sh &
p2=$!
./4INF3.sh &
p3=$!

usage
renice 10 $p1
usage
kill $p3
usage

kill $p1
kill $p2


