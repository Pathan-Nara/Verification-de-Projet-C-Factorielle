#!/bin/sh
mot=$(grep -E '^[[:space:]]*int[[:space:]]+factorielle[[:space:]]*\([[:space:]]*int[[:space:]]+number[[:space:]]*\)' main.c)

if [ -n "$mot" ]; then
  echo "true"
  exit 1
fi

echo "false"
exit 0
