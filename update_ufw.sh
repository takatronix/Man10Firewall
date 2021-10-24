#!/bin/bash
git pull
ufw default allow
while read line;
    do ufw deny from $line to any;
    echo $line
done < iplist.txt
ufw --force enable
ufw reload
echo 終了
