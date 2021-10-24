#!/bin/bash
git checkout .
git pull
sh init.sh
ufw default allow
while read line;
    do ufw deny from $line to any;
done < iplist.txt
ufw --force enable
ufw reload
ufw status verbose
