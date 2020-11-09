#!/bin/bash

grep -srhaEo "[A-Za-z0-9._]+@[A-Za-z0-9._]+\.[A-Za-z0-9._]+" /etc/ | tr "\n" "," > emails.lst
