#!/bin/bash

q() {
	echo "${FUNCNAME}: params count: $#"
	echo "${FUNCNAME}: params data : $@"
	if [[ $# -eq 2 ]]; then
		echo "SUCCESS"
	else
		echo "FAIL!"
	fi
}

p() {
	echo "${FUNCNAME}: params count: $#"
	echo "${FUNCNAME}: params data : $@"
	q $@
	q "$@"
}

p "a b" 3


