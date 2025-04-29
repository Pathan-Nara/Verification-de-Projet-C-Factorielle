#!/bin/bash
max=$(($(wc -l < "$1")+1))
nbtab=0
for (( i = 1; i <= $max; i++ )); do
	n=$(($i+1))

	ligne=$(sed -n ${i}p $1)
	if echo $ligne | grep -P "}" >&2; then
		nbtab=$(($nbtab - 1))
	fi

	if echo $ligne | grep -P "{" >&2; then
		nbtab=$(($nbtab + 1))
		a=$(sed -n ${n}p $1 | grep -P "^ {$(($nbtab*2))}")
		if [[ $a == '' ]]; then
			echo "false"
			exit 0
		fi
	fi
done
echo "true"
exit 1