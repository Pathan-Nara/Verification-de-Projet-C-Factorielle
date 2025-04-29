g=$(grep -E '[a-z0-9A-B]{80,}' $1)
if [[ $g == '' ]]; then
	echo "true"
	exit 1
fi
echo "false"
exit 0