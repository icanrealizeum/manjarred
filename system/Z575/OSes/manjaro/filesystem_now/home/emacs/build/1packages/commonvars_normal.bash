#!/bin/bash
# ^ for vim syntax

#this file should be included for each package

#non-empty value  means it's a package which must use --incremental, unset or empty value means it's a normal package so we must NOT use --incremental
incrementalpackage=
#unset incrementalpackage
#^ don't unset because we're using: set -u

