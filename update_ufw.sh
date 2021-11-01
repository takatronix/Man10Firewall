#!/bin/bash
git pull
ufw default allow
# 通常
while read line;
    do ufw deny from $line to any;
    echo $line
done < iplist.txt
echo iplist処理済み
# blacklist
while read line;
    do ufw deny from $line to any;
    echo $line
done < blacklist.txt
echo blacklist処理済み
# whitelist
while read line;
    do ufw allow from $line to any;
    echo $line
done < whitelist.txt
echo whitelist処理済み
ufw --force enable
ufw reload
echo 終了
