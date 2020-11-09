#!/bin/bash

man bash | grep -oE "\w{4,}" | sort | uniq -ic | sort -n | tail -n 3
