#!/bin/bash
facto=$(./$1 0)
if [[ "$facto" == 1 ]]; then
	echo "true"
	exit 1
fi
echo "false"
exit 0