#!/bin/bash

count=0
ps -u Danila ux | awk '{if ($2 != "PID") {
				count++;
				print $2":"$(11)}
			}
			END {print count}' > task1.answer

