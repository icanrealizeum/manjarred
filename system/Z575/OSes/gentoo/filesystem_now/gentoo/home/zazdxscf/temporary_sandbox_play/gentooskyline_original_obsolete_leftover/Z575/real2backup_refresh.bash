#!/bin/bash

src=""
dest=""
flags="-a --xattrs"

#-a archive (symlinks/devices/attributes/permissions/ownerships etc. are preserved)
#

#XXX: unquoted flags!
rsync $flags -- "$src" "$dest"

