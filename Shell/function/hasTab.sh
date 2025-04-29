#!/bin/sh
max=$(($(wc -l < "$1") + 1))
nbtab=0
for i in $(seq 1 $max); do
  n=$((i + 1))
  ligne=$(sed -n ${i}p "$1")
  echo "$ligne" | grep -q "}" && nbtab=$((nbtab - 1))
  echo "$ligne" | grep -q "{" && {
    nbtab=$((nbtab + 1))
    a=$(sed -n ${n}p "$1" | grep -E "^ {$(($nbtab * 2))}")
    [ -z "$a" ] && echo "false" && exit 0
  }
done
echo "true"
exit 1