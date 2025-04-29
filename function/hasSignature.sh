#!/bin/bash
mot=$(cat main.c | grep -E "(int) (factorielle[(]) (int number) ([)])")

if [[ $mot  ]]; then
	echo "true"
	exit 1
fi
echo "false"
exit 0