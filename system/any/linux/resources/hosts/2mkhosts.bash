#!/bin/bash

set -e -u

source "./common.sh"

cat "$header_fname" "$hosts_MSVP_fname" > "$hosts_fname"

