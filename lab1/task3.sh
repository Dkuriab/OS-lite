#!/bin/bash

echo "Write the number of function you want to start"
echo "1 - Opens Nano"
echo "2 - Opens Vi"
echo "3 - Opens Browser Links"
echo "0 - Exit"

read selection
case ${selection} in
1) nano;;
2) vi;;
3) links;;
0) exit 0;;
*) echo "Please type number in range 0 - 3"
esac


