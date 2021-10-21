#!/bin/sh

cd /home/man10/Man10Firewall/
git pull
python3 /home/man10/Man10Firewall/scripts/man10_firewall.py --threshold 50 --output /home/man10/Man10Firewall/iplist.txt --log /home/man10/mcserver/waterfall/logs/latest.log
git add /home/man10/Man10Firewall/iplist.txt
git commit
git push
