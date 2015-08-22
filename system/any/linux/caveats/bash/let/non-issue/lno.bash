#!/bin/bash

set -x
i='`ls`'
a=1
#i='$a'


# good, they don't work

linen="${BASH_LINENO[$(( i - 1 ))]}"

echo "$linen"

#d=1
#d='`ls`'
d='`echo -n '1' >>times.txt`'

# good, they don't work

if [[ $(( $d - 1 )) ]]; then
  echo "in"
fi

