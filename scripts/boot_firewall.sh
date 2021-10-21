#!/bin/sh
screen -S man10 -X eval 'stuff "say DDoS攻撃元を調査しています...."\015'
cd /home/man10/Man10Firewall/
git pull
python3 /home/man10/Man10Firewall/scripts/man10_firewall.py --threshold 50 --output /home/man10/Man10Firewall/iplist.txt --log /home/man10/mcserver/waterfall/logs/latest.log
git add /home/man10/Man10Firewall/iplist.txt
git commit -m "pushing new information"
git push
screen -S man10 -X eval 'stuff "say DDoS防御システム作動開始しました。"\015'
