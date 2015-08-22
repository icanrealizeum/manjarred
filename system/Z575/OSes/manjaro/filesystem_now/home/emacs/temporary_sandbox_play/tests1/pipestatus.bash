#!/bin/bash

set -o pipefail
echo a | grep "c" | echo b | grep -E "crap"
ps="${PIPESTATUS[@]}"
first="${PIPESTATUS[0]}" ; second="${PIPESTATUS[1]}"
echo "${PIPESTATUS[@]} $first $second $ps"

