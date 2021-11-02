#!/bin/bash
echo $1 >> blacklist.txt
sort blacklist.txt > sorted_blacklist.txt
uniq sorted_blacklist.txt > blacklist.txt
rm sorted_blacklist.txt
git add blacklist.txt
git commit -m "Add blacklist"
git push

