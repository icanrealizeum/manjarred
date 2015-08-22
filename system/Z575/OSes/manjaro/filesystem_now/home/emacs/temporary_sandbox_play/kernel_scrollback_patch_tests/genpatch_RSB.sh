#!/bin/bash

# must be -u1 not -u2 or more because it will otherwise fail to apply due to another patch which increases the buffer size from 1024 to 4096 being applied priorly

cat <<EOFF
[PATCH] vgacon: remember scrollback buffer on console switch
From: Marcin Slusarz 
Date: Sat Oct 25 2008 - 15:58:55 EST
source from: http://lkml.iu.edu//hypermail/linux/kernel/0810.3/0593.html
"
Add support for persistent console history, surviving
console switches. It allocates new scrollback buffer only when
user switches console for the first time.
"

adapted for kernel 3.16-rc7  and  modified/fixed by EmanueL Czirai

added kernel parameter: nopersistentscrollback
which acts as if this patch wasn't applied

EOFF

colordiff --exclude="Kconfig" -u1pr -- a b
colordiff --exclude='*.c' -u3pr -- a b
exit $?
