negative=$(./$1 -89397830858309632)
if [[ "$negative" == "Erreur: nombre negatif" ]]; then
	echo "true"
	exit 1
fi
echo "false"
exit 0