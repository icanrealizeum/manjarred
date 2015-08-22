#!/bin/bash

pushd /

A='
#include "base/metrics/histogram.h"
'
echo "$A" | while read eachline; do
  echo ".${eachline}."
done

popd

