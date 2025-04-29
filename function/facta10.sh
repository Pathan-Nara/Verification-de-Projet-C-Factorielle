fact=(1 2 6 24 120 720 5040 40320 362880 3628800)


for i in {1..10}
do
	res=$(./$1 $i)
	if [[ ! "$res" =~ ^-?[0-9]+$ || "${fact[$i-1]}" != "$res" ]]; then
		echo "false"
		exit 0
	fi
done

echo "true"
exit 1