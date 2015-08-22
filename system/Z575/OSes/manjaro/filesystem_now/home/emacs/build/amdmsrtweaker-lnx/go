#!/bin/bash

if [ `id -u` != 0 ] ; then
    echo "you are not root! press a key, not shift/ctrl/alt"
    read -n 1 -s
    exit 1
fi

scriptdir="$(dirname "$0")"

#on manjaro/arch
#all 4 cores affected
cpupower frequency-set -g conservative
#cpupower frequency-set -g ondemand
#this was on linux mint
#cpufreq-set -g conservative -c 0
#cpufreq-set -g conservative -c 1
#cpufreq-set -g conservative -c 2
#cpufreq-set -g conservative -c 3

modprobe msr
modprobe cpuid
#echo before was:
#"${scriptdir}/amdmsrt"
#echo setting anew:
#this is for
#vendor_id  : AuthenticAMD
#cpu family  : 18
#model   : 1
#model name  : AMD A6-3400M APU with Radeon(tm) HD Graphics
#stepping  : 0
#on my Lenovo Z575
#don't use this anywhere else, or it will corrupt your system, obviously!
#"${scriptdir}/amdmsrt" P0=22@1.0875 P1=20@1.0250 P2=18@0.9625 P3=17@0.9375 P4=16@0.9 P5=14@0.8625 P6=12@0.8125 P7=8@0.7125
"${scriptdir}/amdmsrt" 'I wanna brick my system!'
#"${scriptdir}/amdmsrt"
#echo now is:
#"${scriptdir}/amdmsrt"
rmmod msr
rmmod cpuid

#put network card in auto power mode (cable must be plugged in after boot, else it will fail to wake up, tested this to be true with 3.16-rc7 )
#FIXME: this changes to 02:00.0 when DIScrete gfx card is not disabled in BIOS
#echo 'auto' > '/sys/bus/pci/devices/0000:01:00.0/power/control'
#this is only needed when network card was blacklisted in /etc/default/tlp and that is only needed when using NetworkManager (which is default in Manajaro) but currnetly removed and using manual script to up the network

#keep radeon card in thermal power mode (power state 6  as seen in dmesg)
#only has effect when not using fglrx, otherwise harmless
#actually, /etc/tmpfiles.d/*  is doing this for us:
#[ -f "/sys/class/drm/card0/device/power_dpm_state" ] && echo 'thermal' > /sys/class/drm/card0/device/power_dpm_state
#see with: watch -n1 cat $(find /sys/kernel/debug/dri/ -iname \*pm\*)

#traffic shapeing to increase responsiveness during upload, works so far
#needs (at least) the following kernel modules: 
#cls_u32 sch_ingress sch_sfq sch_cbq act_police
#FIXME: wow this is seriously broken! the download rate is limited to like 30-40 KB/s
#sudo wondershaper -a enp1s0 -d 10000 -u 500
#sudo wondershaper -s -a enp1s0
#clear all limits:
#sudo wondershaper -c -a enp1s0

#sudo /home/emacs/bin/utc
cat /proc/cpuinfo |grep cores

