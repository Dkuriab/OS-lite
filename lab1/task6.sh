#!/bin/bash

from=/var/log/anaconda/X.log
cat $from | grep WW | grep -v "(WW) warning" | sed 's/WW/Warning:/' >> full.log
cat $from | grep II | grep -v "(II) informational" | sed 's/II/Information:/' >> full.log
nano full.log
