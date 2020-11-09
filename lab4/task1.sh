#!/bin/bash

path=`pwd`/$1

[ -d ~/.trash ] || mkdir ~/.trash

last=`ls ~/.trash | sort -n | tail -n 1`

if [[ last == "" ]]; then
	next=0;
else
	next=$((last + 1));
fi

ln $path ~/.trash/$next
rm $path

echo $next $path >> ~/.trash.log
