#!/bin/bash
screen -d -m -S "webhook" ./webhook -hooks hooks.json -verbose
