#!/bin/bash

last_backup=$(ls ~/ | grep Backup-)
dest=~/restore/
rm -rf $dest || true
mkdir -p $dest

if [ "$last_backup" == "" ]; then
	echo "No backups found"
	exit
fi

source=~/$last_backup

for i in $(ls $source); do
	without_suffix=""
	if [[ "${#i}" -ge "12" ]]; then
		without_suffix=${i::-11} || true
	fi
	if [[ "$without_suffix" == "" ]]; then
		cp $source/$i $dest/$i
	elif ! [[ -f $dest/$without_suffix ]]; then
		cp $source/$i $dest/$i
	fi
done
