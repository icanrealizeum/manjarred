#!/bin/sh
set -x
mount -o remount,rw /
dmesg > /shutdown-log.txt
sync
mount -o remount,ro /

