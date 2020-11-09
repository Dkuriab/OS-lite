#!/bin/bash

log=~/.trash.log
trash=~/.trash

restore_dir=""
restore_name=""
restore_hlp=""

restore() {
	succ="false"
	while :
	do
		ln "$restore_hlp" "$restore_dir/$restore_name" && succ="true"
		if [[ "$succ" == "true" ]]; then
			rm "$restore_hlp"
			echo "Restored"
			break
		else
			echo "File exists, put another name"
			read restore_name
		fi
	done
}

for i in $(grep -e "$1$" $log | awk '{printf "%s-%s\n",$1,$2}'); do
	hln=$(echo $i | awk -F "-" '{print $1}')
	restore_hlp="$trash/$hln"

	if ! [[ -f "$restore_hlp" ]]; then
		continue
	fi

	filepath=$(echo $i | awk -F "-" '{print $2}')
	echo "Restore $filepath?(y/n)"
	read rest
	if [[ "$rest" == "y" ]]; then
		restore_name="$(basename $filepath)"
		if [[ -d "$(dirname $filepath)" ]]; then
			restore_dir="$(dirname $filepath)"
		else
			echo "Attemp to restore to homedir"
			restore_dir=~
		fi
		restore
	fi
done
