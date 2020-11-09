#!/bin/bash


mkdir ~/test 2>/dev/null && `echo "catalog test was created sucsessfully" >> ~/report` && touch ~/test/"$(date +"%d_%T")"
ping www.net_nikogo.ru 2>/dev/null || echo "$(date +"%d_%T") " "cann't connect to net_nikigo.ru" >> ~/report
