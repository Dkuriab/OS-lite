#!/bin/bash

pid=$$
echo $pid
ps -efj --sort=start_time | awk '{if($2 != '$pid' && $3 != '$pid') print $0}'| tail -n 1 > task3.answer
