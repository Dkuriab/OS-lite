#!/bin/bash

./task4.sh
count=0
parent=0
awd_prnt=0
while read line
do
    ppid=`echo $line | awk '{ print $3 }' | awk -F "=" '{ print $2 }'`
    awd=`echo $line | awk '{ print $5 }' | awk -F "=" '{ print $2 }'`
    if [[ $ppid -eq $parent ]]
    then
        count=$((count + 1))
        awd_prnt=$(echo "scale=5; $awd_prnt + $awd" | bc)
	echo $line
    else
        res=$(echo "scale=5; $awd_prnt / $count" | bc)
        echo "Average_Sleeping_Children_of_ParentID=$parent is" $res
        echo $line
        parent=$ppid
        count=1
        awd_prnt=$awd
    fi

done < task4.answer > task5.answer
res=$(echo "scale=5; $awd_prnt / $count" | bc)
echo "Average_Sleeping_Children_of_ParentID=$parent is $res" >> task5.answer
