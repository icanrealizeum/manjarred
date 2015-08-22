#!/bin/bash

out="increase_scrollback_buffer_size_from_1024_to_4096_or_kernel_page_size.patch"

cat > "$out" <<EOFF
[PATCH] vgacon: increase scrollback buffer size from 1024 to 4096 (=getconf PAGE_SIZE)
also makes sure that's capped to PAGE_SIZE (which for me it's 4096, so 4MB)
created for kernel 3.16-rc7 by EmanueL Czirai

EOFF

diff -u3pr -- a c >> "$out"
exit $?
