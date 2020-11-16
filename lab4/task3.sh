#!/bin/bash

backup_dir=~/Backup-"$(date -I)"
last_backup=$(ls ~/ | grep Backup- | tail -n 1)
report_file=~/backup_report
existing="false"
source_dir=~/source
touch $report_file || true

lbc=Backup-$(date --date "-7 days" -I)

echo "lbc is  $lbc"
echo "last backup $last_backup"

if [[ "$last_backup" > "$lbc" ]] || [[ "$last_backup" == "$lbc" ]]; then
	if [ "$last_backup" != "" ]; then
		echo "exists realy..."
		existing="true"
		backup_dir=~/$last_backup
	fi
fi

if [ "$existing" == "true" ]; then
	for i in $(ls $source_dir); do
		if ! [[ -f "$backup_dir/$i" ]]; then
			cp "$source_dir/$i" "$backup_dir/$i"
			new_files=$(echo "$new_files"; echo "$i")
		elif [[ -f "$backup_dir/$i" ]]; then
			ecode="$(cmp --silent $backup_dir/$i $source_dir/$i; echo $?)"
			if [[ $ecode -ne 0 ]]; then
				mv "$backup_dir/$i" "$backup_dir/$i.$(date -I)"
				cp "$source_dir/$i" "$backup_dir/$i"
				old_files=$(echo $old_files; echo "$i -> $i.$(date -I)")
			fi
		fi
	done
	echo "$backup_dir updated $new_files $old_files" >> $report_file
else
	mkdir $backup_dir
	cp $source_dir/* $backup_dir/
	echo "$backup_dir created, $(ls $source_dir)" >> $report_file
fi
