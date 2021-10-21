#!/bin/bash
git pull
ufw default allow
ufw --force reset
while read line;
    do ufw deny from $line to any;
done < iplist.txt
ufw --force enable
ufw reload
ufw status verbose
