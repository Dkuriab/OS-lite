#!/bin/bash

ps ax | awk '{ if (( $5 ~ "^/sbin/*" )) print $0 }' > task2.answer

