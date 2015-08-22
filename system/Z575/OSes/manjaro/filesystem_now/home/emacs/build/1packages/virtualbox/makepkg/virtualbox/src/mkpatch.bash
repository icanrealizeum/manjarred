#!/bin/bash

diff -pru5 -- "VirtualBox-4.3.14" "VirtualBox-4.3.14.patched" | awk '/^Only in/ { next;} { print $0; }' >le4.patchy

