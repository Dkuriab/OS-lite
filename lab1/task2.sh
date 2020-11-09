#!/bin/bash

answer=""
current=""

while [[ ${current} != "q" ]]; do
	answer="${answer} ${current}"
	read current
done

echo ${answer}
