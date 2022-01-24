#!/bin/sh
cd /home/man10/Man10Firewall/
git pull
python3 /home/man10/Man10Firewall/scripts/man10_firewall.py --threshold 30 --output /home/man10/Man10Firewall/iplist.txt --log /home/man10/mcserver/waterfall/logs/latest.log
git add /home/man10/Man10Firewall/iplist.txt
git commit -m "Update iplist.txt"
git push

