#!/bin/bash

#exec 1> >(logger -s -t $(basename $0)) 2>&1
#^ this won't send to dmesg!

exec 1>/dev/kmsg 2>&1
set -x

#seen args:
#reboot
#poweroff
#
echo "Script args: $@"

set

#speed up
showgov() {
  cpupower frequency-info|grep --color=always -E '(The governor |current policy: frequency should be within|current CPU frequency:)'
}

showgov
cpupower frequency-set --related --governor performance --min 1400MHz --max 1400MHz
showgov

mount -o remount,rw /
sysctl -a|grep -i sysrq
sysctl -w kernel.sysrq=1
sysctl -a|grep -i sysrq

echo d > /proc/sysrq-trigger
#'d' - Shows all locks that are held.
#src: /home/z/build/1packages/kernel/linuxgit/makepkg_pacman/linux-git/src/linux-git/Documentation/sysrq.txt

#echo l > /proc/sysrq-trigger
echo h > /proc/sysrq-trigger
#[ 4527.376142] sysrq: SysRq : HELP : loglevel(0-9) reboot(b) crash(c) terminate-all-tasks(e) memory-full-oom-kill(f) kill-all-tasks(i) thaw-filesystems(j) sak(k) show-backtrace-all-active-cpus(l) show-memory-usage(m) nice-all-RT-tasks(n) poweroff(o) show-registers(p)  show-all-timers(q) unraw(r) sync(s) show-task-states(t) unmount(u) force-fb(V) show-blocked-tasks(w) 
echo m > /proc/sysrq-trigger
#echo t > /proc/sysrq-trigger
echo w > /proc/sysrq-trigger
echo 9 > /proc/sysrq-trigger



#src: https://bbs.archlinux.org/viewtopic.php?pid=1066560#p1066560
#tested, no effect:
echo -n 'Before:';  cat /sys/block/sda/device/queue_depth
#echo 1 > /sys/block/sda/device/queue_depth
echo -n 'After:';  cat /sys/block/sda/device/queue_depth

#info:
hdparm -W /dev/sda
hdparm -C /dev/sda

#don't have tee or sysctl, have sudo(apparently)
#workaround for: https://bugzilla.kernel.org/show_bug.cgi?id=151621#c2
echo 'sync first'
time sync
echo "Before:"
echo m > /proc/sysrq-trigger #has no effect: ; dmesg|grep -F "pagecache pages"|tail -1
echo 'manually Freeing pagecache pages'
#don't have sysctl: time sysctl vm.drop_caches=1
#XXX: comment out following drop_caches line(s) to test deactivate_super's speed(it lingers at "Unmounting /oldroot")
#To free pagecache(works fine: 51640 pagecache pages freed/sec + 10 sec spent in deactivate_super):
#time echo 1 >/proc/sys/vm/drop_caches
#To free dentries and inodes(untested):
#time echo 2 >/proc/sys/vm/drop_caches
#To free pagecache, dentries and inodes(41479 pagecache pages freed/sec):
time echo 3 >/proc/sys/vm/drop_caches
echo "After :"
echo m > /proc/sysrq-trigger #has no effect: ;dmesg|grep -F "pagecache pages"|tail -1

#XXX: temporary!!!
#  time sync && sdparm --command=sync /dev/sda && sleep 1
#  echo 'Manual shutdown attempt via sysrq(sleep 15) so it hangs on stopdisk'
#  echo o > /proc/sysrq-trigger ; sleep 15
#XXX: end temp.

ls /sys/bus/pci/devices/0000:00:1{2,3}*/power/runtime_status
cat /sys/bus/pci/devices/0000:00:1{2,3}*/power/runtime_status
#echo 'on' > /sys/bus/pci/devices/0000:00:12.0/power/control
#echo 'on' > /sys/bus/pci/devices/0000:00:12.2/power/control
#echo 'on' > /sys/bus/pci/devices/0000:00:13.0/power/control
#echo 'on' > /sys/bus/pci/devices/0000:00:13.2/power/control
#cat /sys/bus/pci/devices/0000:00:1{2,3}*/power/runtime_status
echo 'end of log'

dmesg > /dmesg_shutdown.log
time sync && sdparm --command=sync /dev/sda && sleep 1
mount -o remount,ro /

#src: https://unix.stackexchange.com/questions/55281/how-to-stop-waking-all-attached-drives-on-reboot-deactivating-swap/55417#55417
#turn off drive cache, workaround for https://bugzilla.kernel.org/show_bug.cgi?id=151631
#XXX: comment out following line to prevent rebooting from happening(due to aforementioned bug just 1 line above) after deactivate_super finished(aka when "Unmounting /oldroot" is done) to see the printk's time(uptime) so you can calc. the difference manually
#ok, this turns off drive cache, so poweroff/reboot will not hang (but poweroff will still hang when attempting to stop drive which is its 2nd step after cache flushing)
#XXX: temporarily commented out:
#hdparm -W0 /dev/sda
hdparm -W /dev/sda

#flush drive cache:
hdparm -F /dev/sda
hdparm -f /dev/sda
sleep 1

#this is not necessary(for clean reboot!):
#make drive sleep(not suspend/shutdown)
##hdparm -y /dev/sda
#if test "$@" == "poweroff"; then
#  echo 'manually powering off /dev/sda'
#  hdparm -Y /dev/sda
#  #^ this works but systemd is waking it up from sleep as soon as this $0 script is done! so, it's useless to suspend it here! unless I force shutdown of system myself(dno how really)
#fi
#hdparm -C /dev/sda

#deactivate_super runs after this script, when you see: "shutdown[1]: Unmounting /oldroot." this frees: 22342 pagecache pages per second (if the above manual freeing didn't happen - but sync was called like always)

#this won't run: (sleep 30 ; echo 'autorebooting'; sleep 1; echo b > /proc/sysrq-trigger ) &
if ! test "$1" == "poweroff"; then
  #it's reboot, or something else(if ever possible)
  #XXX: the following 3 lines should be commented out! temporarily allowing them now:
  #echo 'sleep 30' # then manual shutdown via sysrq'
  sleep 30
#  echo o > /proc/sysrq-trigger ; sleep 5
  echo "End of '$0'"
else
  #it's poweroff aka shutdown
#  echo 'Manually powering off /dev/sda:'
  #XXX: temp commented out!
#  hdparm -Y /dev/sda
  #poweroff by sysrq - this still needs kernel patch to not stop disk in kernel because that'd fail the same way!
#  echo 'Manual shutdown via sysrq:'
  #XXX: temp commented out!
#  echo o > /proc/sysrq-trigger ; sleep 5
  #echo "End of '$0' (looks like shutdown failed - since you're still up!)"
  ls /sys/bus/pci/devices/0000:00:1{2,3}*/power/runtime_status
  cat /sys/bus/pci/devices/0000:00:1{2,3}*/power/runtime_status
  echo "End of '$0'"
fi
