#!/bin/bash

if [[ ${PWD} != ${HOME} ]]; then
	echo "You aren't in home dir"
	exit 1
else
	echo ${HOME}
	exit 0
fi
