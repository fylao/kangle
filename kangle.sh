#!/bin/bash
export START="kangle.fylao.com"
export UPTIME="$(curl -s http://kangle.fylao.com/uptime.txt)"
rm -rf kangle-start.sh kangle-start.* kangle.sh kangle.*
wget ${START}/kangle-start.sh -O kangle-start.sh
sh kangle-start.sh