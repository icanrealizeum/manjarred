#!/bin/bash

echo "this was needed before catalyst-test could be installed"

for each in $(cat alist.lst); do
	ls -la "$each"
	#rm "$each"
done
