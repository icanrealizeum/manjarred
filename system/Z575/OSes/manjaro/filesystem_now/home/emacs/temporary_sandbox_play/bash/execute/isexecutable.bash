#!/bin/bash

a() {
  cbmexe="$(which catalyst_build_module)"
  echo "cbmexe=$cbmexe"
#  if [ -n "$cbmexe" ] && [ -x "${cbmexe}" ]; then
  if [ -x "${cbmexe}" ]; then
    echo "recompiling fglrx module for ${KERNEL_VERSION} :"
    ${cbmexe} ${KERNEL_VERSION}
    local ec=$?
    if [[ $ec -eq 0 ]]; then
      echo "success."
    else
      #TODO: make errors be red so it's more obvious
      echo "failed!"
    fi
    return $ec
  else
    echo "skipping"
  fi
}

a

