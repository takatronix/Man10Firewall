#!/bin/bash
git pull
ufw enable
ufw default allow
ufw --force reset
while read line;
    do ufw deny from $line to any;
done < iplist.txt
ufw status verbose
