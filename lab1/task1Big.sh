#!/bin/bash

for v in "$@"; do
	echo "$v"
done | sort -n


