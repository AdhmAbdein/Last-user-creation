#!/bin/bash


awk 'BEGIN{ FS= ":" }{ if ($3 >= 1000){print $6} }' /etc/passwd | while read line
do
        if [ $(stat -c %Y "$line") -gt $(date -d 'yesterday' +%s) ]
        then
           echo ""$line" is new user and created last 24 h"
        fi

done

# -c custom format
# %Y format specifier that tells stat to output the last modification time

