#!/bin/bash

#exec 1> >(logger -s -t $(basename $0)) 2>&1
#^ this won't send to dmesg!

exec 1>/dev/kmsg 2>&1

set -x
mount -o remount,rw /
sysctl -a|grep -i sysrq
sysctl -w kernel.sysrq=1
sysctl -a|grep -i sysrq

echo d > /proc/sysrq-trigger
#'d' - Shows all locks that are held.
#src: /home/z/build/1packages/kernel/linuxgit/makepkg_pacman/linux-git/src/linux-git/Documentation/sysrq.txt

echo l > /proc/sysrq-trigger
echo h > /proc/sysrq-trigger
echo m > /proc/sysrq-trigger
echo t > /proc/sysrq-trigger
echo w > /proc/sysrq-trigger
echo 9 > /proc/sysrq-trigger



#src: https://bbs.archlinux.org/viewtopic.php?pid=1066560#p1066560
#tested, no effect:
echo -n 'Before:';  cat /sys/block/sda/device/queue_depth
#echo 1 > /sys/block/sda/device/queue_depth
echo -n 'After:';  cat /sys/block/sda/device/queue_depth

dmesg > /shutdown-log.txt
sync
mount -o remount,ro /

#this won't run: (sleep 30 ; echo 'autorebooting'; sleep 1; echo b > /proc/sysrq-trigger ) &

